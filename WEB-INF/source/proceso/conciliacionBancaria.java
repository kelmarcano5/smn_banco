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

public class conciliacionBancaria extends GenericTransaction{
	private static final int INTEGER = 0;
	private static final int VARCHAR = 0;
	/* (non-Javadoc)
	 * @see dinamica.GenericTransaction#service(dinamica.Recordset)
	 */

	static File newTextFile = new File("./log.txt");
	//static File newTextFile = new File("./log.txt");

	Timestamp timestamp = new Timestamp(System.currentTimeMillis());

	public int service(Recordset inputParams) throws Throwable
	{
		FileWriter fw = new FileWriter(newTextFile);

		int rc = 0;
		int nc = 0; // cantidad de registros No conciliados
		int rl = 0; // cantidad de registros leidos
		
		String mensaje = "";


		//reuse superclass code
		super.service(inputParams);

		//set request attributes in case of forward to another Action
		getRequest().setAttribute("plantilla_id", inputParams.getString("plantilla_id"));


		//get security datasource
		String jndiName = (String)getContext().getAttribute("dinamica.security.datasource");
		if (jndiName==null)
			throw new Throwable("Context attribute [dinamica.security.datasource] is null, check your security filter configuration.");

		//get datasource and DB connection
		DataSource ds = Jndi.getDataSource(jndiName); 
		Connection conn = ds.getConnection();
		this.setConnection(conn);

		try {
			mensaje = "INICIO DE PROCESO";
			fw.write("Mensaje " + mensaje +  "\n");
			//get db channel
			Db db = getDb();
			// Buscar los saldos de la Compania ano anterior
			int cant_no_conciliadas = 0;
			String getplantilla_cab = getSQL(getResource("query-getplantilla_cab.sql"), inputParams);
			Recordset plantillacab = db.get(getplantilla_cab);
			if(plantillacab.getRecordCount() > 0){
				while (plantillacab.next()){
					mensaje = "LINEA 66";
					fw.write("Mensaje " + mensaje +  "\n");

					String entidad_rf = plantillacab.getString("entidad_rf");
					int entidad_rf_int = Integer.parseInt(entidad_rf);
					inputParams.setValue("entidad_rf", entidad_rf_int);
					String sucursal_rf = plantillacab.getString("sucursal_rf");
					int sucursal_rf_int = Integer.parseInt(sucursal_rf);
					inputParams.setValue("sucursal_rf", sucursal_rf_int);
					String banco_rf = plantillacab.getString("banco_rf");
					int banco_rf_int = Integer.parseInt(banco_rf);
					inputParams.setValue("banco_rf", banco_rf_int);
					String cuenta_bancaria_rf = plantillacab.getString("cuenta_bancaria_rf");
					int cuenta_bancaria_rf_int = Integer.parseInt(cuenta_bancaria_rf);
					inputParams.setValue("cuenta_bancaria_rf", cuenta_bancaria_rf_int);
					
					fw.write("entidad_rf_int " + entidad_rf_int +  "\n");
					fw.write("sucursal_rf_int " + sucursal_rf_int +  "\n");
					fw.write("banco_rf_int " + banco_rf_int +  "\n");
					fw.write("cuenta_bancaria_rf_int " + cuenta_bancaria_rf_int +  "\n");

					// VERIFICAR SI EXISTE CABECERA CON FECHA ANTERIOR QUE NO HAYA SIDO CONCILIADA
					String fecha_mov = plantillacab.getString("fecha_movimiento");

					Date fecha_mov_date=new SimpleDateFormat("yyyy-MM-dd").parse(fecha_mov); 
					inputParams.setValue("fecha_movimiento", fecha_mov_date);
					String getplantilla_cab_ant = getSQL(getResource("query-getplantilla_cab_ant.sql"), inputParams);
					Recordset plantillacabant = db.get(getplantilla_cab_ant);
					if(plantillacabant.getRecordCount() > 0){
						while (plantillacabant.next()){
							mensaje = "Hay plantilla(s) No conciliada(s) con fecha anterior";
							fw.write("Mensaje " + mensaje +  "\n");
							cant_no_conciliadas=1;
						}
					}else{
						// LEER DETALLE DE PLANTILLAS BANCARIAS PRIMERA VEZ PARA VER TRANSACCIONES IGUALES
						String getplantilla_det = getSQL(getResource("query-getplantilla_det.sql"), inputParams);
						Recordset plantilladet = db.get(getplantilla_det);
						if(plantilladet.getRecordCount() > 0){
							while (plantilladet.next()){
								String det_id = plantilladet.getString("det_id");
								int det_id_int = Integer.parseInt(det_id);
								inputParams.setValue("detalle_id", det_id_int);

								String equivalencia_ref_ban = plantilladet.getString("equivalencia_ref_ban");
								int equivalencia_ban_int = Integer.parseInt(equivalencia_ref_ban);
								inputParams.setValue("equivalencia_ban", equivalencia_ban_int);

								String numero_ref_ban = plantilladet.getString("numero_ref_ban");
								//long numero_ref_ban_int = Long.parseLong(numero_ref_ban);

								inputParams.setValue("numero_ref_ban", numero_ref_ban);

								String monto_ml_ban = plantilladet.getString("monto_ml_ban");
								Double monto_ml_ban_dou = Double.parseDouble(monto_ml_ban);
								inputParams.setValue("monto_ml_ban", monto_ml_ban_dou);
								
								
								// VERIFICAR SI EXISTE UNA TRANSACCION BANCARIA IGUAL PERO CON SIGNO CONTRARIO
								
								String getplantilla_det_igual = getSQL(getResource("query-getplant_detigual.sql"), inputParams);
								
								Recordset plantilladetigual = db.get(getplantilla_det_igual);
								if(plantilladetigual.getRecordCount() > 0){
									mensaje = "LINEA 120";
									fw.write("Mensaje " + mensaje +  "\n");

									while (plantilladetigual.next()){
										String det_id2 = plantilladetigual.getString("det_id2");
										int det_id_int2 = Integer.parseInt(det_id2);
										inputParams.setValue("detalle_id2", det_id_int2);

										String update_det_iguales = getSQL(getResource("query-update_detalles_iguales.sql"), inputParams);

										db.exec(update_det_iguales);
									}
								}
							}
						}
						mensaje = "LINEA 135";
						fw.write("Mensaje " + mensaje +  "\n");
						// LEER DETALLE DE PLANTILLAS BANCARIAS SEGUNDA VEZ
						getplantilla_det = getSQL(getResource("query-getplantilla_det.sql"), inputParams);
						Recordset plantilladet2 = db.get(getplantilla_det);
						if(plantilladet2.getRecordCount() > 0){
							while (plantilladet2.next()){
								String det_id = plantilladet2.getString("det_id");
								int det_id_int = Integer.parseInt(det_id);
								inputParams.setValue("detalle_id", det_id_int);

								String equivalencia_ref_ban = plantilladet2.getString("equivalencia_ref_ban");
								int equivalencia_ban_int = Integer.parseInt(equivalencia_ref_ban);
								inputParams.setValue("equivalencia_ban", equivalencia_ban_int);

								String str = plantilladet2.getString("numero_ref_ban");
								String numero_ref_ban;
								int largo = str.length();
								int ini=1;
								if(largo>6){
									ini = largo - 6;
								};
								int fin=ini+6;
								if(fin>largo){
									fin=largo;
								};
								numero_ref_ban = (str.substring(ini, fin));
								
								fw.write("str " + str +  "\n");
								fw.write("ini " + ini +  "\n");
								fw.write("fin" + fin +  "\n");
								fw.write("numero_ref_ban " + numero_ref_ban +  "\n");
								
								//long numero_ref_ban_int = Long.parseLong(numero_ref_ban);

								inputParams.setValue("numero_ref_ban", numero_ref_ban);

								String monto_ml_ban = plantilladet2.getString("monto_ml_ban");
								Double monto_ml_ban_dou = Double.parseDouble(monto_ml_ban);
								inputParams.setValue("monto_ml_ban", monto_ml_ban_dou);

								String tipo_doc = plantilladet2.getString("tipo_doc");
								inputParams.setValue("tipo_doc", tipo_doc);
								
								fw.write("numero_ref_ban " + numero_ref_ban +  "\n");
								fw.write("monto_ml_ban_dou " + monto_ml_ban_dou +  "\n");
								
								String smn_formas_pago_rf = plantilladet2.getString("smn_formas_pago_rf");
								int smn_formas_pago_rf_int = Integer.parseInt(smn_formas_pago_rf);
								inputParams.setValue("smn_formas_pago_rf", smn_formas_pago_rf_int);
								String doc_es_cobranza = plantilladet2.getString("doc_es_cobranza");
								inputParams.setValue("doc_es_cobranza", doc_es_cobranza);

								// BUSCAR EN MOVIMIENTO BANCARIO TRANSACCION A CONCILIAR
								String getmovban = getSQL(getResource("query-getmovimiento_ban.sql"), inputParams);
								Recordset rsmovban = db.get(getmovban);
								if(rsmovban.getRecordCount() > 0){
									while (rsmovban.next()){
										mensaje = "LINEA 169";
										fw.write("Mensaje " + mensaje +  "\n");
										String modulo = rsmovban.getString("modulo");
										String mov_id = rsmovban.getString("mov_id");
										int mov_id_int = Integer.parseInt(mov_id);
										inputParams.setValue("mov_id", mov_id_int);
										rsmovban.setValue("mov_id", mov_id_int);
										rsmovban.setValue("detalle_id", det_id_int);
										// SE ACTUALIZAN LOS STATUS DE LAS DOS TABLAS A CONCILIADAS CN
										//String updatereg = getSQL(getResource("query-update.sql"), inputParams);
										String updatereg = getSQL(getResource("query-update.sql"), rsmovban);
										db.exec(updatereg);
										// PROCESO QUE ACTUALIZA O CREA RELACION DE COBRANZA
										if(doc_es_cobranza.contains("S")){
											
											String updrelcob = getSQL(getResource("query-update_relacion_cobranza.sql"), rsmovban);

											db.exec(updrelcob);
											
										}
										// PROCESAR DISPONIBILIDAD
										// LEER SALDO DIA ANTERIOR CUENTA BANCARIA
										Double sal_anterior=0.00;
										String getsalant = getSQL(getResource("query-get_saldo_ant_cta_bancaria.sql"), inputParams);
										Recordset rssalant = db.get(getsalant);
										if(rssalant.getRecordCount() > 0){
											while (rssalant.next()){
												String monto_sal_ant = rssalant.getString("saldo_final_anterior");
												sal_anterior = Double.parseDouble(monto_sal_ant);
											}

										}
										inputParams.setValue("monto_ml_sal_ant", sal_anterior);
										Double saldo_inicial=sal_anterior;
										Double deposito=0.00;
										Double nota_credito=0.00;
										Double cheque=0.00;
										Double nota_debito=0.00;
										Double saldo_final=0.00;
										int saldo_cta_bancaria_id=0;
										
										mensaje = "LINEA 228";
										fw.write("Mensaje " + mensaje +  "\n");
										fw.write("tipo_doc " + tipo_doc +  "\n");
										fw.write("monto_ml_ban_dou " + monto_ml_ban_dou +  "\n");
										if(tipo_doc.contains("ND")){
											nota_debito=monto_ml_ban_dou;
											
										}else{
											if(tipo_doc.contains("CH")){
												cheque=monto_ml_ban_dou;
											}else{
												if(tipo_doc.contains("DP")){
													deposito=monto_ml_ban_dou;
												}else{
													if(tipo_doc.contains("NC")){
														nota_credito=monto_ml_ban_dou;
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
												
												deposito=deposito+deposito_act_dou;
												nota_credito=nota_credito+nota_credito_act_dou;
												cheque=cheque+cheque_act_dou;
												nota_debito=nota_debito+nota_debito_act_dou;
												saldo_final=saldo_inicial+nota_credito-cheque-nota_debito;
												
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
											saldo_final=saldo_inicial+nota_credito-cheque-nota_debito;
											
											inputParams.setValue("monto_ml_sal_ant", saldo_inicial);
											inputParams.setValue("monto_ml_deposito", deposito);
											inputParams.setValue("monto_ml_nota_credito", nota_credito);
											inputParams.setValue("monto_ml_cheque", cheque);
											inputParams.setValue("monto_ml_nota_debito", nota_debito);
											inputParams.setValue("monto_ml_saldo_final", saldo_final);
											
											String insertsal = getSQL(getResource("query-insert_saldo_cta_bancaria.sql"), inputParams);

											db.exec(insertsal);
										}
										
										
									}
								}else{
									mensaje = "LINEA 183";
									fw.write("Mensaje " + mensaje +  "\n");
									String status="NC";
									if(tipo_doc.contains("ND") || tipo_doc.contains("CH")){
										status="AL";
									}
									fw.write("status " + status +  "\n");
									inputParams.setValue("status", status);
									String update_det_iguales = getSQL(getResource("query-update_det_no_conciliado.sql"), inputParams);

									db.exec(update_det_iguales);
									cant_no_conciliadas=cant_no_conciliadas+1;
								}



							}
						}else{
							mensaje = "LINEA 200";
							fw.write("Mensaje " + mensaje +  "\n");
							// ACTUALIZAR LA CABECERA DE PLANTILLA BANCARIA A CN
							if(cant_no_conciliadas==0){
								String status="CN";
								inputParams.setValue("status", status);
								String updatecab = getSQL(getResource("query-update_cab.sql"), inputParams);
								
								db.exec(updatecab);
							}else{
								String status="EC";
								inputParams.setValue("status", status);
								String updatecab = getSQL(getResource("query-update_cab.sql"), inputParams);
								
								db.exec(updatecab);
							};
						}


					}
				}
				mensaje = "LINEA 211";
				fw.write("Mensaje " + mensaje +  "\n");
				// ACTUALIZAR LA CABECERA A CONCILIADO SINO HUBO REGISTROS NO CONCILIADOS
				if(cant_no_conciliadas==0){
					String status="CN";
					inputParams.setValue("status", status);
					String updatecab = getSQL(getResource("query-update_cab.sql"), inputParams);

					db.exec(updatecab);
				}else{
					String status="EC";
					inputParams.setValue("status", status);
					String updatecab = getSQL(getResource("query-update_cab.sql"), inputParams);
					
					db.exec(updatecab);
				}


			}
			
			mensaje = "FINAL DE PROCESO";
			fw.write("Mensaje " + mensaje +  "\n");
		}
		catch (Throwable e)
		{
			throw e;
		}
		finally
		{
			if (conn!=null)
				conn.close();
		}	
		fw.close();

		return 0;
	}
}
