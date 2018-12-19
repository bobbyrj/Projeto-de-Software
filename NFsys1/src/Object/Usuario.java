package Object;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

public class Usuario {

	public static synchronized boolean addTroca(Troca troca) {
		try {
			ConexaoBD a = new ConexaoBD();
			a.iniciaBd();
			Connection c = a.getConexao();
			
			PreparedStatement ps = (PreparedStatement) c.prepareStatement("INSERT INTO troca (idtroca, idnf, datatroca, iditemdefeito, iditemsaida, motivo) values (?,?,?,?,?,?)");
			ps.setString(1,troca.getId());
			ps.setString(2,troca.getIdNotaFiscal());
			ps.setDate(3,troca.getDataTroca());
			ps.setString(4,troca.getIdItemDevolvido());
			ps.setString(5,troca.getItemSaida());
			ps.setString(6,troca.getMotivo());
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
	
	public static synchronized boolean addItemNf (NotaFiscal n1) {
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
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			if (c != null) {
				a.fechaBd();
				return true;
			}
			
			return false;
		}
	}

	public static synchronized String listaNS(String numSerie) {
		try {
			LinkedList<String> listaNS = new LinkedList<String>();

			ConexaoBD a = new ConexaoBD();
			a.iniciaBd();
			Connection c = a.getConexao();
			PreparedStatement ps = (PreparedStatement) c.prepareStatement("select * from produto where id LIKE '%" + numSerie + "%'");
			ResultSet res = (ResultSet) ps.executeQuery();
			System.out.println(numSerie);
						
			if (res.next()) {
				System.out.println(res.getString("id"));
				System.out.println(res.getString("idnfiscal"));				
				
				return res.getString("id");		
			}

			ps.close();
			c.close();
			a.fechaBd();
			
			
			//return false;
			return "";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			//return false;
			return "";
		}

	}
}


