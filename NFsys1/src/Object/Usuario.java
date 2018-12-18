package Object;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.LinkedList;
import java.util.List;

public class Usuario {

	public static synchronized boolean addTroca(Troca troca) {
		try {
			ConexaoBD a = new ConexaoBD();
			a.iniciaBd();
			Connection c = a.getConexao();
			PreparedStatement ps = (PreparedStatement) c.prepareStatement("INSERT INTO troca (idtroca, motivo, iditemdevolvido, iditemsaida, idnf) values ?,?,?,?,?");
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
			PreparedStatement ps = (PreparedStatement) c.prepareStatement("INSERT INTO notafiscal (id, modelo, numserie, numfiscal, datanf) values ?,?,?,?,?");
			ps.setString(1, n1.getId());
			ps.setString(2, n1.getModelo());
			ps.setString(3, n1.getSerie());
			ps.setString(4, n1.getNumero());
			ps.setTimestamp(5, new Timestamp(n1.getDataVenda().getTimeInMillis()));		
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
	
	public static synchronized boolean addItemNf(Item item) {
		try {	
			ConexaoBD a = new ConexaoBD();
			a.iniciaBd();
			Connection c = a.getConexao();
			PreparedStatement ps = (PreparedStatement) c.prepareStatement("INSERT INTO produto (id,codprod, numserie, nfiscal, trocado) values ?,?,?,?,?");
			ps.setString(1, item.getId());
			ps.setString(2, item.getCodigoProduto());
			ps.setString(3, item.getNumeroDeSerie());
			ps.setString(4, item.getNotaFiscal().getId());
			ps.setBoolean(5, item.getTrocado());			
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

	public static synchronized LinkedList<String> listarNomes() {
		try {
			LinkedList<String> lNomes = new LinkedList<String>();

			ConexaoBD a = new ConexaoBD();
			a.iniciaBd();
			Connection c = a.getConexao();
			PreparedStatement ps = (PreparedStatement) c.prepareStatement("select * from alunos order by nome");
			ResultSet res = (ResultSet) ps.executeQuery();
			while (res.next()) {
				lNomes.add(res.getString("nome"));
			}

			ps.close();
			c.close();
			a.fechaBd();
			return lNomes;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}
}


