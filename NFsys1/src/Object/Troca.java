package Object;

import java.time.LocalDate;
import java.util.Date;
import java.util.UUID;

public class Troca {
	
	
	
	public Troca(String motivo, String idNotaFiscal, String iditemDevolvido,
			String iditemSaida) {
		Id = UUID.randomUUID().toString();
		DataTroca = java.sql.Date.valueOf(LocalDate.now());
		Motivo = motivo;
		this.idNotaFiscal = idNotaFiscal;
		idItemDevolvido = iditemDevolvido;
		idItemSaida = iditemSaida;
	}

	private String Id;
	private java.sql.Date DataTroca;
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
