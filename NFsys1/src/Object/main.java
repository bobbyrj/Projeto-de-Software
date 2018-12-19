package Object;

import java.sql.Connection;

public class main {
	public static void main ( String args[]) {
		ConexaoBD a = new ConexaoBD();
		a.iniciaBd();
		Connection c = a.getConexao();
		
	}
}
