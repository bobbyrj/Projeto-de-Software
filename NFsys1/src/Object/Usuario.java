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
			
			PreparedStatement ps = (PreparedStatement) c.prepareStatement("INSERT INTO troca (idtroca, motivo, iditemdevolvido, iditemsaida, idnf) values (?,?,?,?,?)");
			ps.setString(1,troca.getId());
			ps.setString(2,troca.getMotivo());
			ps.setString(3,troca.getItemDevolvido().getId());
			ps.setString(4,troca.getItemSaida().getId());
			ps.setString(5,troca.getNotaFiscal().getId());
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
			PreparedStatement ps = (PreparedStatement) c.prepareStatement("INSERT INTO notafiscal (idnf, numfiscal, numserie, modelo) values (?,?,?,?)");
			ps.setString(1, n1.getId());
			ps.setString(2, n1.getNumero());
			ps.setString(3, n1.getSerie());
			ps.setString(4, n1.getModelo());			
			//ps.setDate(5, n1.getDataVenda());
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
	
	public static synchronized boolean addItemNf(NotaFiscal n1) {
		try {	
			ConexaoBD a = new ConexaoBD();
			a.iniciaBd();
			Connection c = a.getConexao();
			
			List<Item> item = n1.getItems();
			for(int i = 0; i < n1.getItems().size(); i++) {
				PreparedStatement ps = (PreparedStatement) c.prepareStatement("INSERT INTO produto (id, codprod, numserie, trocado, baixa, nfiscal) values (?,?,?,?,?,?)");
				ps.setString(1, item.get(i).getId());
				ps.setString(2, item.get(i).getCodigoProduto());			
				ps.setString(3, item.get(i).getNumeroDeSerie());
				ps.setBoolean(4, item.get(i).getTrocado());
				ps.setBoolean(5, item.get(i).getBaixa());
				ps.setString(6, item.get(i).getNotaFiscal().getId());						
				ps.executeUpdate();
				ps.close();
			}				
			c.close();
			a.fechaBd();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}

	public static synchronized boolean listaNS(String numSerie) {
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
				return true;		
			}

			ps.close();
			c.close();
			a.fechaBd();
			
			
			return false;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}

	}
}


