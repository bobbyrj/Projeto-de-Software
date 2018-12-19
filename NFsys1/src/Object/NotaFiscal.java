package Object;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class NotaFiscal {
	
	
	public NotaFiscal(String modelo, String serie, String numero, String dataVenda, List<Item> items) {

		Numero = numero;		
		Serie = serie;
		Modelo = modelo;
		Id = Modelo + "-" + Serie + "-" + Numero;
		Items = items;
		this.setDataVenda(dataVenda);
	}
	
	public NotaFiscal () {
		
	}
	private String Id;
	private String Modelo;
	private String Serie;
	private String Numero;
	private java.sql.Date DataVenda;
	private List<Item> Items;
	
	public String getModelo() {
		return Modelo;
	}
	public void setModelo(String modelo) {
		Modelo = modelo;
	}
	public String getSerie() {
		return Serie;
	}
	public void setSerie(String serie) {
		Serie = serie;
	}
	public String getNumero() {
		return Numero;
	}
	public void setNumero(String numero) {
		Numero = numero;
	}
	public java.sql.Date getDataVenda() {
		return (java.sql.Date) DataVenda;
	}
	public void setDataVenda(String dataVenda) {
		SimpleDateFormat input = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'-'HH:mm");
		SimpleDateFormat output = new SimpleDateFormat("yyyy-MM-dd");
		//dd/MM/yyyy
		
		java.sql.Date d = null;
		try 
		{
		   d = (java.sql.Date) input.parse("2018-10-08T14:57:42-03:00");
		} 
		catch (Exception e) 
		{
		   e.printStackTrace();
		}		
		
		DataVenda = d;
	}
	public List<Item> getItems() {
		return Items;
	}
	public void setItems(List<Item> items) {
		Items = items;
	}
	
	public boolean addItem (Item it) {
		Items.add(it);
		return true;
	}
	public boolean retiraItem (Item it) {
		Items.remove(it);
		return true;
	}
	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public void setId() {
		Id = Modelo + "-" + Serie + "-" + Numero;
	}
}
