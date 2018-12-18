package Object;

import org.apache.commons.fileupload.FileItem;

import java.io.File;  
import java.io.FileInputStream;
import java.io.FileOutputStream;  
import java.io.InputStream; 

public class Arquivo {

	public String guardaArquivo(FileItem arq, String nome, String caminhoAplicacao)
	{		
		String pasta="";
		try{
			File dir = new File(caminhoAplicacao);  
		if (!dir.exists()) {  
           dir.mkdir();  
        }
		pasta = caminhoAplicacao+nome;
		File upload = new File(dir, nome);  
        FileOutputStream gravado = new FileOutputStream(upload);  
        InputStream instre = arq.getInputStream();  
        byte[] buf = new byte[3072];  
        int aux;  
        while ((aux = instre.read(buf)) >= 0) 
        {  
          gravado.write(buf, 0, aux);  
        }  
        gravado.flush();  
        gravado.close();
        }
		catch(Exception e)
		{
			e.printStackTrace();
		    return nome;
		}
		return nome;  
	}
}
