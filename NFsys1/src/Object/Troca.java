package Object;

import java.util.Calendar;
import java.util.UUID;

public class Troca {
	
	
	
	public Troca(Calendar dataTroca, String motivo, NotaFiscal notaFiscal, Item itemDevolvido,
			Item itemSaida) {
		Id = UUID.randomUUID().toString();
		DataTroca = Calendar.getInstance();
		Motivo = motivo;
		NotaFiscal = notaFiscal;
		ItemDevolvido = itemDevolvido;
		ItemSaida = itemSaida;
	}

	private String Id;
	private Calendar DataTroca;
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

	public Calendar getDataTroca() {
		return DataTroca;
	}

	public void setDataTroca(Calendar dataTroca) {
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
