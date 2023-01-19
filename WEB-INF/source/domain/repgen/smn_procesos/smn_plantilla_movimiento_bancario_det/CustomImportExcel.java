package domain.repgen.smn_procesos.smn_plantilla_movimiento_bancario_det;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import dinamica.ImportExcel;

public class CustomImportExcel extends ImportExcel
{	
	@Override
	public InputStream getInputStream(File file) throws Throwable 
	{

		InputStream f = new FileInputStream(file); 
		InputStream xls = new domain.convert.ExcelConvertHelper().convertFromXLSXtoXLS(f);
		
		return xls;
	}
	
	 @Override
     public String[] getParamsNames() throws Throwable 
	 {
        String[] params = new String[] {"pmd_fecha",
        		                        "pmd_numero_referencia_bancaria",        		                       
        		                        "pmd_descripcion",
        		                        "pmd_monto",
        		                        "smn_equivalencia_doc_bancario_id",
        		                        " "};
        System.out.print(params);
        return params;
     }
	 


}
