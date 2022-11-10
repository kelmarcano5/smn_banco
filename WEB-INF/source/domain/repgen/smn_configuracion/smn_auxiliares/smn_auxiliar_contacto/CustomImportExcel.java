package domain.repgen.smn_configuracion.smn_auxiliares.smn_auxiliar_contacto;

import dinamica.ImportExcel;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

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
        String[] params = new String[] {"acn_telefono_fijo",
        		                        "acn_telefono_movil",
        		                        "acn_email",
        		                        "acn_facebook",
        		                        "acn_linkedin",
        		                        "acn_twitter",
        		                        "acn_swift"};
        return params;
     }
	 


}
