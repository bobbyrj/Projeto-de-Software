package Object;

import java.util.Date;

public class Troca {
	
	
	
	public Troca(String motivo, String idNotaFiscal, String iditemDevolvido,
			String iditemSaida) {
		
		DataTroca = new Date();
		Motivo = motivo;
		this.idNotaFiscal = idNotaFiscal;
		idItemDevolvido = iditemDevolvido;
		idItemSaida = iditemSaida;
	}

	private String Id;
	private java.util.Date DataTroca;
	private String Motivo;
	private String idNotaFiscal;	
	private String idItemDevolvido;
	private String idItemSaida;
	
	public String getId() {
		return Id;
	}

	public void setId(String id) {
		Id = id;
	}

	public Date getDataTroca() {
		return DataTroca;
	}

	public String getMotivo() {
		return Motivo;
	}

	public void setMotivo(String motivo) {
		Motivo = motivo;
	}

	public String getIdNotaFiscal() {
		return idNotaFiscal;
	}

	public void setIdNotaFiscal(String idNotaFiscal) {
		this.idNotaFiscal = idNotaFiscal;
	}

	public String getIdItemDevolvido() {
		return idItemDevolvido;
	}

	public void setIdItemDevolvido(String itemDevolvido) {
		idItemDevolvido = itemDevolvido;
	}

	public String getItemSaida() {
		return idItemSaida;
	}

	public void setItemSaida(String itemSaida) {
		idItemSaida = itemSaida;
	}
	
	
}
