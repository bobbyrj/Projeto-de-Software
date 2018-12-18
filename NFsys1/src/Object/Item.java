package Object;

public class Item {
	
	public Item(Produto Produto, String numeroDeSerie, NotaFiscal notaFiscal, boolean trocado) {		
		CodigoProduto = Produto.getCodigoProduto();
		NumeroDeSerie = numeroDeSerie;
		NotaFiscal = notaFiscal;
		Id = CodigoProduto + "-" + NumeroDeSerie + "-" + NotaFiscal.getNumero();
		Trocado = false;
	}
		

	public Item () {
		
	}
	
	private String Id;
	private String CodigoProduto;
	private String NumeroDeSerie;
	private NotaFiscal NotaFiscal;
	private boolean Trocado;

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
}
