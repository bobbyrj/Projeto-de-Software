package Object;

public class Item {
	
	public Item(Produto Produto, String numeroDeSerie, NotaFiscal notaFiscal) {		
		CodigoProduto = Produto.getCodigoProduto();
		NumeroDeSerie = numeroDeSerie;
		NotaFiscal = notaFiscal;
		Id = CodigoProduto + "-" + NumeroDeSerie + "-" + NotaFiscal.getNumero();
		Trocado = false;
		Baixa = false;
	}
		

	public Item () {
		
	}
	
	private String Id;
	private String CodigoProduto;
	private String NumeroDeSerie;
	private NotaFiscal NotaFiscal;
	private boolean Trocado;
	private boolean Baixa;

	public String getId() {
		return Id;
	}
	public void setId() {
		if (CodigoProduto != null && NumeroDeSerie!= null) {
			Id = CodigoProduto + "-" + NumeroDeSerie + "-" + NotaFiscal.getNumero();
		}
	}
	public String getCodigoProduto() {
		return CodigoProduto;
	}
	
	public void setCodigoProduto(String codigoProduto) {
		CodigoProduto = codigoProduto;
	}
	public String getNumeroDeSerie() {
		return NumeroDeSerie;
	}
	public void setNumeroDeSerie(String numeroDeSerie) {
		NumeroDeSerie = numeroDeSerie;
	}
	public NotaFiscal getNotaFiscal() {
		return NotaFiscal;
	}
	public void setNotaFiscal(NotaFiscal notaFiscal) {
		NotaFiscal = notaFiscal;
	}
	public boolean getTrocado() {
		return Trocado;
	}
	public void setTrocado(boolean trocado) {
		Trocado = trocado;
	}


	public boolean getBaixa() {
		// TODO Auto-generated method stub
		return Baixa;
	}
}
