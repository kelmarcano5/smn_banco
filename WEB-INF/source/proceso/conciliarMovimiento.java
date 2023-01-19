package proceso;

import dinamica.*;

import javax.sql.DataSource;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.Date;
import java.io.Console;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.*;
import java.text.SimpleDateFormat;  


public class conciliarMovimiento extends GenericTransaction{
    private static final int INTEGER = 0;
    private static final int VARCHAR = 0;

    static File newTextFile = new File("./log.txt");

    Timestamp timestamp = new Timestamp(System.currentTimeMillis());

    public int service(Recordset inputParams) throws Throwable{
        FileWriter fw = new FileWriter(newTextFile);

        int rc = 0;
        int nc = 0; // cantidad de registros No conciliados
        int rl = 0; // cantidad de registros leidos

        String mensaje = "";
        super.service(inputParams);
        getRequest().setAttribute("movimiento_bancario_id", inputParams.getString("movimiento_bancario_id"));

        String jndiName = (String)getContext().getAttribute("dinamica.security.datasource");

        if (jndiName==null)
            throw new Throwable("Context attribute [dinamica.security.datasource] is null, check your security filter configuration.");

        DataSource ds = Jndi.getDataSource(jndiName); 
        Connection conn = ds.getConnection();
        this.setConnection(conn);

        try {
            mensaje = "INICIO DE PROCESO";
            fw.write("Mensaje " + mensaje +  "\n");
            Db db = getDb();


            String getmovimiento_ban = getSQL(getResource("query-getmovimiento_ban.sql"), inputParams);
            Recordset movimientoban = db.get(getmovimiento_ban);
            if(movimientoban.getRecordCount() > 0){
                while (movimientoban.next()){
                    mensaje = "LINEA 67";
                    fw.write("Mensaje " + mensaje +  "\n");

                    String entidad_rf = movimientoban.getString("entidad_rf");
                    int entidad_rf_int = Integer.parseInt(entidad_rf);
                    inputParams.setValue("entidad_rf", entidad_rf_int);
                    String sucursal_rf = movimientoban.getString("sucursal_rf");
                    int sucursal_rf_int = Integer.parseInt(sucursal_rf);
                    inputParams.setValue("sucursal_rf", sucursal_rf_int);
                    String banco_rf = movimientoban.getString("banco_rf");
                    int banco_rf_int = Integer.parseInt(banco_rf);
                    inputParams.setValue("banco_rf", banco_rf_int);
                    String cuenta_bancaria_rf = movimientoban.getString("cuenta_bancaria_rf");
                    int cuenta_bancaria_rf_int = Integer.parseInt(cuenta_bancaria_rf);
                    inputParams.setValue("cuenta_bancaria_rf", cuenta_bancaria_rf_int);

                    // VERIFICAR SI EXISTE CABECERA CON FECHA ANTERIOR QUE NO HAYA SIDO CONCILIADA
                    String fecha_mov = movimientoban.getString("fecha_movimiento");

                    Date fecha_mov_date=new SimpleDateFormat("yyyy-MM-dd").parse(fecha_mov); 
                    inputParams.setValue("fecha_movimiento", fecha_mov_date);

                    String tipo_doc = movimientoban.getString("tipo_doc");
                    inputParams.setValue("tipo_doc", tipo_doc);

                    String monto_ml_ban = movimientoban.getString("monto_ml_ban");
                    Double monto_ml_ban_dou = Double.parseDouble(monto_ml_ban);
                    inputParams.setValue("monto_ml_ban", monto_ml_ban_dou);

                    String moneda_rf = movimientoban.getString("moneda_rf");
                    inputParams.setValue("moneda_rf", 0);

                    if(moneda_rf != null){
                        int moneda_rf_int = Integer.parseInt(moneda_rf);
                        inputParams.setValue("moneda_rf", moneda_rf_int);
                    }

                    String tasa_rf = movimientoban.getString("tasa_rf");
                    inputParams.setValue("tasa_rf", 0);

                    if(tasa_rf != null){
                        int tasa_rf_int = Integer.parseInt(tasa_rf);
                        inputParams.setValue("tasa_rf", tasa_rf_int);
                    }

                    String smn_formas_pago_rf = movimientoban.getString("smn_formas_pago_rf");
                    int smn_formas_pago_rf_int = Integer.parseInt(smn_formas_pago_rf);
                    inputParams.setValue("smn_formas_pago_rf", smn_formas_pago_rf_int);
                    String doc_es_cobranza = movimientoban.getString("doc_es_cobranza");

                    if(doc_es_cobranza == null){
                        doc_es_cobranza="N";
                    }

                    inputParams.setValue("doc_es_cobranza", doc_es_cobranza);
                    String equivalencia_ref_ban = movimientoban.getString("equivalencia_ref_ban");
                    int equivalencia_ban_int = Integer.parseInt(equivalencia_ref_ban);
                    inputParams.setValue("equivalencia_ban", equivalencia_ban_int);
                    String tipo_doc_id = movimientoban.getString("tipo_doc_id");
                    int tipo_doc_id_int = Integer.parseInt(tipo_doc_id);
                    inputParams.setValue("tipo_doc_id", tipo_doc_id_int);

                    //------------------------------
                    // PROCESAR DISPONIBILIDAD
                    // LEER SALDO DIA ANTERIOR CUENTA BANCARIA
                    Double sal_anterior = 0.00;
                    String getsalant = getSQL(getResource("query-get_saldo_ant_cta_bancaria.sql"), inputParams);
                    Recordset rssalant = db.get(getsalant);

                    if(rssalant.getRecordCount() > 0){
                        while (rssalant.next()){
                            String monto_sal_ant = rssalant.getString("saldo_final_anterior");
                            sal_anterior = Double.parseDouble(monto_sal_ant);
                        }
                    }

                    inputParams.setValue("monto_ml_sal_ant", sal_anterior);
                    Double saldo_inicial = sal_anterior;
                    Double deposito = 0.00;
                    Double nota_credito = 0.00;
                    Double cheque = 0.00;
                    Double nota_debito = 0.00;
                    Double saldo_final = 0.00;
                    int saldo_cta_bancaria_id = 0;
                    mensaje = "LINEA 153";
                    fw.write("Mensaje " + mensaje +  "\n");
                    fw.write("tipo_doc " + tipo_doc +  "\n");
                    fw.write("monto_ml_ban_dou " + monto_ml_ban_dou +  "\n");

                    if(tipo_doc.contains("ND")){
                        nota_debito = monto_ml_ban_dou;
                    }else{
                        if(tipo_doc.contains("CH")){
                            cheque = monto_ml_ban_dou;
                        }else{
                            if(tipo_doc.contains("DP")){
                                deposito = monto_ml_ban_dou;
                            }else{
                                if(tipo_doc.contains("NC")){
                                    nota_credito = monto_ml_ban_dou;
                                }
                            }
                        }
                    }

                    // LEER SALDO DIA ACTUAL CUENTA BANCARIA
                    String getsalban = getSQL(getResource("query-get_saldo_cta_bancaria.sql"), inputParams);
                    Recordset rssalban = db.get(getsalban);

                    if(rssalban.getRecordCount() > 0){
                        while (rssalban.next()){
                            String saldo_cta_bancaria = rssalban.getString("saldo_cta_bancaria_id");
                            saldo_cta_bancaria_id = Integer.parseInt(saldo_cta_bancaria);
                            inputParams.setValue("saldo_cta_bancaria_id", saldo_cta_bancaria_id);

                            String deposito_act = rssalban.getString("deposito_act");
                            Double deposito_act_dou = Double.parseDouble(deposito_act);
                            String nota_credito_act = rssalban.getString("nota_credito_act");
                            Double nota_credito_act_dou = Double.parseDouble(nota_credito_act);
                            String cheque_act = rssalban.getString("cheque_act");
                            Double cheque_act_dou = Double.parseDouble(cheque_act);
                            String nota_debito_act = rssalban.getString("nota_debito_act");
                            Double nota_debito_act_dou = Double.parseDouble(nota_debito_act);

                            deposito=deposito + deposito_act_dou;
                            nota_credito = nota_credito + nota_credito_act_dou;
                            cheque= cheque + cheque_act_dou;
                            nota_debito= nota_debito + nota_debito_act_dou;
                            saldo_final= saldo_inicial + deposito + nota_credito - cheque - nota_debito;

                            inputParams.setValue("monto_ml_sal_ant", saldo_inicial);
                            inputParams.setValue("monto_ml_deposito", deposito);
                            inputParams.setValue("monto_ml_nota_credito", nota_credito);
                            inputParams.setValue("monto_ml_cheque", cheque);
                            inputParams.setValue("monto_ml_nota_debito", nota_debito);
                            inputParams.setValue("monto_ml_saldo_final", saldo_final);

                            String updatesal = getSQL(getResource("query-update_saldo_cta_bancaria.sql"), inputParams);
                            db.exec(updatesal);
                        }

                    }else{
                        saldo_final = saldo_inicial + deposito + nota_credito - cheque - nota_debito;
                        inputParams.setValue("monto_ml_sal_ant", saldo_inicial);
                        inputParams.setValue("monto_ml_deposito", deposito);
                        inputParams.setValue("monto_ml_nota_credito", nota_credito);
                        inputParams.setValue("monto_ml_cheque", cheque);
                        inputParams.setValue("monto_ml_nota_debito", nota_debito);
                        inputParams.setValue("monto_ml_saldo_final", saldo_final);
                        String insertsal = getSQL(getResource("query-insert_saldo_cta_bancaria.sql"), inputParams);
                        db.exec(insertsal);
                    }

                    // PROCESO QUE CREA RELACION DE COBRANZA
                    if(doc_es_cobranza.contains("S")){
                        String insrelcob = getSQL(getResource("query-update_relacion_cobranza.sql"), inputParams);
                        db.exec(insrelcob);
                    }

                    // ACTUALIZAR LA CABECERA A CONCILIADO SINO NO HUBO REGISTROS NO CONCILIADOS
                    String updatemov = getSQL(getResource("query-update_movimiento.sql"), inputParams);
                    db.exec(updatemov);
                }
            }
            fw.write("Mensaje " + mensaje +  "\n");
            mensaje = "FINAL DE PROCESO";
            fw.write("Mensaje " + mensaje +  "\n");

            if (conn!=null)
                conn.close();
            fw.close();
            return 0;

        }catch (Throwable e){
            throw e;
        }
    }
}