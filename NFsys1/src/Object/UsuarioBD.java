package Object;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

public class UsuarioBD {

	public static synchronized boolean addTroca(Troca troca) throws SQLException {
		Connection c = null;
		PreparedStatement ps = null;
		ConexaoBD a = null;	
		
		try {	
			a = new ConexaoBD();
			a.iniciaBd();			
			c = a.getConexao();						
			c.setAutoCommit(false);			
			
			String insertTroca = "INSERT INTO troca" +
			"(idtroca, idnf, datatroca, iditemdefeito, iditemsaida, motivo) values" +
					"(?,?,?,?,?,?)";
			
			String insertProduto = "INSERT INTO produto" +
			"(id, codprod, numserie, trocado, baixa, idnfiscal) values" +
					"(?,?,?,?,?,?)";
			
			ps = (PreparedStatement) c.prepareStatement(insertTroca);

			ps.execute("SET FOREIGN_KEY_CHECKS=0");	
			ps.setInt(1, 0);
			ps.setString(2,troca.getIdNotaFiscal());
			ps.setDate(3,troca.getDataTroca());
			ps.setString(4,troca.getIdItemDevolvido());
			ps.setString(5,troca.getItemSaida());
			ps.setString(6,troca.getMotivo());
			ps.addBatch();
			
			ps = (PreparedStatement) c.prepareStatement(insertProduto);
			
			ps.setString(1, troca.getItemSaida());
			ps.setString(2, troca.getItemSaida().split("-")[0]);			
			ps.setString(3, troca.getItemSaida().split("-")[1]);
			ps.setBoolean(4, true);
			ps.setBoolean(5, false);
			ps.setString(6, troca.getIdNotaFiscal());
			ps.addBatch();
						
			ps.executeBatch();
			ps.executeUpdate("UPDATE produto SET baixa = '1' WHERE numserie = '" + troca.getIdItemDevolvido().split("-")[1] + "'");
			
			
			c.commit();
			ps.execute("SET FOREIGN_KEY_CHECKS=1");
			
			System.out.println("TROCA deu certo");
			
			
		} catch (SQLException e) {
			
			c.rollback();
			e.printStackTrace();
			return false;
			
		} finally {
			
			if (ps != null) {

				ps.close();			

			}
			
			if (c != null) {
				a.fechaBd();
				return true;
			}
			
			return false;
		}
	}
	
	public static synchronized boolean addNf(NotaFiscal n1) {
		try {				
			
			
			ConexaoBD a = new ConexaoBD();
			a.iniciaBd();
			Connection c = a.getConexao();
			PreparedStatement ps = (PreparedStatement) c.prepareStatement("INSERT INTO notafiscal (idnf, numero, serie, modelo, datanf) values (?,?,?,?,?)");
			ps.setString(1, n1.getId());
			ps.setString(2, n1.getNumero());
			ps.setString(3, n1.getSerie());
			ps.setString(4, n1.getModelo());			
			ps.setDate(5, n1.getDataVenda());
			ps.executeUpdate();
			ps.close();
			c.close();
			a.fechaBd();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	public static synchronized boolean addItemNf (NotaFiscal n1) throws SQLException {
		Connection c = null;
		PreparedStatement ps = null;
		ConexaoBD a = null;
		
		try {	
			a = new ConexaoBD();
			a.iniciaBd();			
			c = a.getConexao();						
			c.setAutoCommit(false);
			
			List<Item> item = n1.getItems();
			
			String insertSql = "INSERT INTO produto" +
			"(id, codprod, numserie, trocado, baixa, idnfiscal) values" +
					"(?,?,?,?,?,?)";
			ps = (PreparedStatement) c.prepareStatement(insertSql);
			
			for(int i = 0; i < n1.getItems().size(); i++) {
				
				ps.setString(1, item.get(i).getId());
				ps.setString(2, item.get(i).getCodigoProduto());			
				ps.setString(3, item.get(i).getNumeroDeSerie());
				ps.setBoolean(4, item.get(i).getTrocado());
				ps.setBoolean(5, item.get(i).getBaixa());
				ps.setString(6, item.get(i).getNotaFiscal().getId());
				ps.addBatch();
				
			}
			ps.executeBatch();
			
			c.commit();
			
			System.out.println("deu certo");
			
			
		} catch (SQLException e) {
			
			c.rollback();
			e.printStackTrace();
			return false;
			
		} finally {
			
			if (ps != null) {

				ps.close();			

			}
			
			if (c != null) {
				a.fechaBd();
				return true;
			}
			
			return false;
		}
	}

	public static synchronized List<String> listaNS(String numSerie) {
		try {
			LinkedList<String> listaNS = new LinkedList<String>();

			ConexaoBD a = new ConexaoBD();
			a.iniciaBd();
			Connection c = a.getConexao();
			PreparedStatement ps = (PreparedStatement) c.prepareStatement("select * from produto where numserie = '" + numSerie + "' AND baixa <> 1");
			ResultSet res = (ResultSet) ps.executeQuery();
			System.out.println(numSerie);
			List<String> ids = new ArrayList<String>();
						
			if (res.next()) {
				System.out.println(res.getString("id"));
				System.out.println(res.getString("idnfiscal"));				
				ids.add(res.getString("id"));
				ids.add(res.getString("idnfiscal"));
				return ids;	
			}

			ps.close();
			c.close();
			a.fechaBd();
			
			
			//return false;
			return null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//return false;
			return null;
		}

	}
	
	public static synchronized List<String> geraRelatorio(String tabela, String atributo, List<String> dados) {
		try {
			

			ConexaoBD a = new ConexaoBD();
			a.iniciaBd();
			Connection c = a.getConexao();
			PreparedStatement ps;

			String sqlUmAtributo = "SELECT * FROM " + tabela + " WHERE "
			+ atributo + " = '" + dados.get(0) +"'"
			;

			String sqlData = "SELECT * FROM " + tabela + " WHERE "
			+ atributo + " >= '" + dados.get(0) + "' AND "
			+ atributo + " <= '" + dados.get(1) + "'";					
			
			if (dados.size() > 1) {
				ps = (PreparedStatement) c.prepareStatement(sqlUmAtributo);
			} else {
				ps = (PreparedStatement) c.prepareStatement(sqlData);
			}
			
			
			ResultSet res = (ResultSet) ps.executeQuery();
			
			List<String> ids = new ArrayList<String>();
						
			if (res.next()) {
				System.out.println(res.getString("id"));
				System.out.println(res.getString("idnfiscal"));				
				ids.add(res.getString("id"));
				ids.add(res.getString("idnfiscal"));
				return ids;	
			}

			ps.close();
			c.close();
			a.fechaBd();
			
			
			//return false;
			return null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//return false;
			return null;
		}

	}

	public static synchronized boolean addSenha (String login, String senha, String acesso) throws Exception {
		try {
			
			ConexaoBD a = new ConexaoBD();
			a.iniciaBd();
			Connection c = a.getConexao();
			PreparedStatement ps = (PreparedStatement) c.prepareStatement("INSERT INTO usuario (login, senha, acesso) values (?,?,?)");
			
			MessageDigest algorithm = MessageDigest.getInstance("SHA-256");
			byte[] messageDigest = algorithm.digest(senha.getBytes(StandardCharsets.UTF_8));			 
			StringBuilder hexString = new StringBuilder();
			for (byte b : messageDigest) {
			  hexString.append(String.format("%02X", 0xFF & b));
			}
			senha = hexString.toString();

			ps.setString(1, login);
			ps.setString(2, senha);
			ps.setString(3, acesso);
			
			ps.executeUpdate();
			ps.close();
			c.close();
			a.fechaBd();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
	
	public static synchronized String RecuperaSenha (String login, String senha) throws Exception {
		try {			
		
			ConexaoBD a = new ConexaoBD();
			a.iniciaBd();
			Connection c = a.getConexao();
			PreparedStatement ps = (PreparedStatement) c.prepareStatement("select * from usuario where login = '" + login + "'");
			ResultSet res = (ResultSet) ps.executeQuery();			
			
			String senhaBD;
			
			if (res.next()) {				
				senhaBD = res.getString("senha");	
				MessageDigest algorithm = MessageDigest.getInstance("SHA-256");
				byte messageDigest[] = algorithm.digest(senha.getBytes(StandardCharsets.UTF_8));

				StringBuilder hexString = new StringBuilder();
				for (byte b : messageDigest) {
				  hexString.append(String.format("%02X", 0xFF & b));
				}
				senha = hexString.toString();
				
				if (senha.equals(senhaBD)) return res.getString("acesso");
				
			}
			
			

			ps.close();
			c.close();
			a.fechaBd();
			
			return null;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//return false;
			return null;
		}

	}
}


