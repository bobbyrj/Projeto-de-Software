package Object;

import java.time.LocalDate;
import java.util.Date;
import java.util.UUID;

public class Troca {
	
	
	
	public Troca(String motivo, NotaFiscal notaFiscal, Item itemDevolvido,
			Item itemSaida) {
		Id = UUID.randomUUID().toString();
		DataTroca = java.sql.Date.valueOf(LocalDate.now());
		Motivo = motivo;
		NotaFiscal = notaFiscal;
		ItemDevolvido = itemDevolvido;
		ItemSaida = itemSaida;
	}

	private String Id;
	private java.sql.Date DataTroca;
	private String Motivo;
	private NotaFiscal NotaFiscal;	
	private Item ItemDevolvido;
	private Item ItemSaida;
	
	public void MudarStatusItemDevolvido() {
		ItemDevolvido.setTrocado(true);
	}

	
	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public java.sql.Date getDataTroca() {
		return DataTroca;
	}

	public void setDataTroca(java.sql.Date dataTroca) {
		DataTroca = dataTroca;
	}

	public String getMotivo() {
		return Motivo;
	}

	public void setMotivo(String motivo) {
		Motivo = motivo;
	}

	public NotaFiscal getNotaFiscal() {
		return NotaFiscal;
	}

	public void setNotaFiscal(NotaFiscal notaFiscal) {
		NotaFiscal = notaFiscal;
	}

	public Item getItemDevolvido() {
		return ItemDevolvido;
	}

	public void setItemDevolvido(Item itemDevolvido) {
		ItemDevolvido = itemDevolvido;
	}

	public Item getItemSaida() {
		return ItemSaida;
	}

	public void setItemSaida(Item itemSaida) {
		ItemSaida = itemSaida;
	}
	
	
}
