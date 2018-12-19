package Object;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConexaoBD {
	// objeto de conex�o
	private Connection con;

	public void iniciaBd() {
		try {
			// jdbc:mysql//PortaDeConex�o/NomeDoEsquema
			String database = "jdbc:mysql://localhost:3307/projetonf";
			// nome do usu�rio para acessar o banco
			String usuario = "root";
			// senha para acessar o banco
			String senha = "usbw";
			// chama a conex�o para que o jar seja utilizado
			Class.forName("com.mysql.jdbc.Driver");
			// criando a conex�o/instanciando o objeto conex�o, passando como
			// parametros o database, usuario e senha
			con = (Connection) DriverManager.getConnection(database, usuario, senha);

		} catch (Exception e) {
			e.printStackTrace();
		} // o bloco deve conter os comandos try e catch pois pode gerar alguma
			// exce��o
	}

	// fecha a conex�o
	public void fechaBd() {
		try {
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// retorna a conex�o
	public Connection getConexao() {
		
		System.out.println("sucesso");
		
		return con;
	}
}

