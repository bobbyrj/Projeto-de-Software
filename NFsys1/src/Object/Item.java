package Object;

public class Item {
	
	public Item(Produto Produto, String numeroDeSerie, NotaFiscal notaFiscal) {		
		CodigoProduto = Produto.getCodigoProduto();
		setDescricao(Produto.getDescricao());
		NumeroDeSerie = numeroDeSerie;
		NotaFiscal = notaFiscal;
		setId();
		Trocado = false;
		Baixa = false;
	}
		
	public Item(String Codprod, String descricao, String NumSerie, NotaFiscal notaFiscal) {		
		CodigoProduto = Codprod;
		setDescricao(descricao);
		NumeroDeSerie = NumSerie;
		NotaFiscal = notaFiscal;
		setId();
		Trocado = false;
		Baixa = false;
	}
	
	public Item () {
		
	}
	
	private String Id;
	private String Descricao;
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
	public void setId(String posicao) {
		if (CodigoProduto != null && NumeroDeSerie!= null) {
			Id = posicao + "-" + CodigoProduto + "-" + NumeroDeSerie + "-" + NotaFiscal.getNumero();
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


	public String getDescricao() {
		return Descricao;
	}


	public void setDescricao(String descricao) {
		Descricao = descricao;
	}
}
