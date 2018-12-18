package Object;

public class Produto {
	
	public Produto(String codigoProduto, String descricao, int qtd) {		
		CodigoProduto = codigoProduto;
		Descricao = descricao;
		this.qtd = qtd;
		
	}	

	public Produto () {
		
	}
	
	private String CodigoProduto;
	private String Descricao;
	private int qtd;
	
	public String getCodigoProduto() {
		return CodigoProduto;
	}



	public void setCodigoProduto(String codigoProduto) {
		CodigoProduto = codigoProduto;
	}

	public String getDescricao() {
		return Descricao;
	}

	public void setDescricao(String descricao) {
		Descricao = descricao;
	}

	public int getQtd() {
		return qtd;
	}

	public void setQtd(int qtd) {
		this.qtd = qtd;
	}	

}
