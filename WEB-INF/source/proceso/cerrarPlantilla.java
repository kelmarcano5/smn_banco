package proceso;

import dinamica.*;

import javax.sql.DataSource;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.Date;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.*;
import java.text.SimpleDateFormat;  

public class cerrarPlantilla extends GenericTransaction{
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

					// VERIFICAR SI EXISTE CABECERA CON FECHA ANTERIOR QUE NO HAYA SIDO CONCILIADA
					String fecha_mov = plantillacab.getString("fecha_movimiento");

					Date fecha_mov_date=new SimpleDateFormat("yyyy-MM-dd").parse(fecha_mov); 
					inputParams.setValue("fecha_movimiento", fecha_mov_date);


					// LEER DETALLE DE PLANTILLAS BANCARIAS
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
							if(equivalencia_ban_int>0){
								String str = plantilladet.getString("numero_ref_ban");
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
								inputParams.setValue("numero_ref_ban", numero_ref_ban);
								
								String numero_ref_ban2 = plantilladet.getString("numero_ref_ban");
								//long numero_ref_ban_int2 = Long.parseLong(numero_ref_ban2);
								
								inputParams.setValue("numero_ref_bancaria", numero_ref_ban2);

								String monto_ml_ban = plantilladet.getString("monto_ml_ban");
								Double monto_ml_ban_dou = Double.parseDouble(monto_ml_ban);
								inputParams.setValue("monto_ml_ban", monto_ml_ban_dou);

								String tipo_doc = plantilladet.getString("tipo_doc");
								inputParams.setValue("tipo_doc", tipo_doc);

								String tipo_doc_id = plantilladet.getString("tipo_doc_id");
								int tipo_doc_id_int = Integer.parseInt(tipo_doc_id);
								inputParams.setValue("tipo_doc_id", tipo_doc_id_int);

								String descripcion = plantilladet.getString("descripcion");
								inputParams.setValue("descripcion", descripcion);


								String moneda_rf = plantilladet.getString("moneda_rf");
								if(moneda_rf==null){
									inputParams.setValue("moneda_rf", 0);

								}else{
									int moneda_rf_int = Integer.parseInt(moneda_rf);
									inputParams.setValue("moneda_rf", moneda_rf_int);
								}

								String fecha = plantilladet.getString("fecha");
								Date fecha_date=new SimpleDateFormat("yyyy-MM-dd").parse(fecha); 
								inputParams.setValue("fecha", fecha_date);

								String tasa_rf = plantilladet.getString("tasa_rf");
								if(tasa_rf==null){
									inputParams.setValue("tasa_rf", 0);
								}else{
									int tasa_rf_int = Integer.parseInt(tasa_rf);
									inputParams.setValue("tasa_rf", tasa_rf_int);
								}
								String monto_ma_ban = plantilladet.getString("monto_ma_ban");
								if(monto_ma_ban==null){
									Double monto_ma_ban_dou = 0.00;
									inputParams.setValue("monto_ma_ban", monto_ma_ban_dou);
								}else{
									Double monto_ma_ban_dou = Double.parseDouble(monto_ma_ban);
									inputParams.setValue("monto_ma_ban", monto_ma_ban_dou);
								}
								
								String smn_formas_pago_rf = plantilladet.getString("smn_formas_pago_rf");
								int smn_formas_pago_rf_int = Integer.parseInt(smn_formas_pago_rf);
								inputParams.setValue("smn_formas_pago_rf", smn_formas_pago_rf_int);
								String doc_es_cobranza = plantilladet.getString("doc_es_cobranza");
								inputParams.setValue("doc_es_cobranza", doc_es_cobranza);
								String smn_cliente_rf = plantilladet.getString("smn_cliente_rf");
								
								if(smn_cliente_rf==null){
									int smn_cliente_rf_int = 0;
								     inputParams.setValue("smn_cliente_rf", smn_cliente_rf_int);
									String getcliente = getSQL(getResource("query-get_cliente.sql"), inputParams);
									Recordset rsgetcliente = db.get(getcliente);
									if(rsgetcliente.getRecordCount() > 0){
										while (rsgetcliente.next()){
											String smn_cliente_rf2 = rsgetcliente.getString("smn_cliente_id");
											if(smn_cliente_rf2==null){
											int smn_cliente_rf2_int = 0;
											inputParams.setValue("smn_cliente_rf", smn_cliente_rf2_int);
											}else{
												int smn_cliente_rf2_int = Integer.parseInt(smn_cliente_rf2);
												inputParams.setValue("smn_cliente_rf", smn_cliente_rf2_int);
											}
										}
									}
								}else{
									int smn_cliente_rf_int = Integer.parseInt(smn_cliente_rf);
								     inputParams.setValue("smn_cliente_rf", smn_cliente_rf_int);
								}
								
								String documento_general_rf = plantilladet.getString("documento_general_rf");
								int documento_general_rf_int = Integer.parseInt(documento_general_rf);
								inputParams.setValue("documento_general_rf", documento_general_rf_int);
								
								String insertmovban = getSQL(getResource("insert_movimiento_ban.sql"), inputParams);
								Recordset rsinsertmovban = db.get(insertmovban);
								if(rsinsertmovban.getRecordCount() > 0){
									while (rsinsertmovban.next()){
										String mov_id = rsinsertmovban.getString("mov_id");
										int mov_id_int = Integer.parseInt(mov_id);
										inputParams.setValue("mov_id", mov_id_int);

										if(tipo_doc.contains("ND") || tipo_doc.contains("CH")){
											String insertalarm = getSQL(getResource("insert_alarma.sql"), inputParams);
											Recordset rsinsertalarm = db.get(insertalarm);
										}

										String update_det = getSQL(getResource("query-update_det_conciliado.sql"), inputParams);

										db.exec(update_det);
										//------------------------------
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
										
										mensaje = "LINEA 204";
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
										
										
									
										
										//-----------------------------
									}
									// PROCESO QUE CREA RELACION DE COBRANZA
									if(doc_es_cobranza.contains("S")){
										String insrelcob = getSQL(getResource("query-insert_relacion_cobranza.sql"), inputParams);

										db.exec(insrelcob);
									}
								}
							}else{
								nc=nc+1; //Registro no se concilia
								mensaje = "Detalle no se concilia porque no tiene equivalencia bancaria";
								fw.write("Mensaje " + mensaje + " ID detalle= "+ det_id_int +  "\n");
							}
						}
					}

					if(nc==0){
					// ACTUALIZAR LA CABECERA A CONCILIADO SINO NO HUBO REGISTROS NO CONCILIADOS
						String updatecab = getSQL(getResource("query-update_cab.sql"), inputParams);

						db.exec(updatecab);
					}else{
						mensaje = "Plantilla cabecera no se concilia, porque hay detalles no conciliados";
						fw.write("Mensaje " + mensaje +  "\n");
					}
					

				}
			}
			fw.write("Mensaje " + mensaje +  "\n");
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