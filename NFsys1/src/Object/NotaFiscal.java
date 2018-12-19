package Object;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class NotaFiscal {
	
	
	public NotaFiscal(String modelo, String serie, String numero, Calendar dataVenda, List<Item> items) {

		Numero = numero;		
		Serie = serie;
		Modelo = modelo;
		Id = Modelo + "-" + Serie + "-" + Numero;
		//DataVenda = dataVenda;
		//Calendar c = Calendar.getInstance();
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();		
		DataVenda = date;
		Items = items;
	}
	
	public NotaFiscal () {
		
	}
	private String Id;
	private String Modelo;
	private String Serie;
	private String Numero;
	private Date DataVenda;
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
	public void setDataVenda(Calendar dataVenda) {
		DataVenda = dataVenda;
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
