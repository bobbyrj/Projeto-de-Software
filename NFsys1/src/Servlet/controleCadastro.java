package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Object.Item;
import Object.NotaFiscal;
import Object.Produto;

/**
 * Servlet implementation class controleCadastro
 */
public class controleCadastro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public controleCadastro() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();	
		List<Produto> produto = (List<Produto>) session.getAttribute("prod");
		String numSerie = (String) request.getParameter("nSerie");
		NotaFiscal nf1 = (NotaFiscal) session.getAttribute("nf");
		String nProduto = (String) session.getAttribute("nProduto");
		
		String alterarProduto = request.getParameter("alterarproduto");
		
		if (alterarProduto != null && alterarProduto.equals("alterar")) {
			int i = Integer.parseInt(request.getParameter("seqProduto"));
			Item alterado = nf1.getItems().get(i);
			Item novo = alterado;
			
			session.setAttribute("itemAlterado", alterado.getNumeroDeSerie());
			
			novo.setNumeroDeSerie((String) request.getParameter("nSerie"));
			nf1.getItems().remove(alterado);
			nf1.getItems().add(novo);
			
			
			session.setAttribute("itemNovo", novo);
			
			response.sendRedirect("SelecionaProduto.jsp");
			
		} else {
			Set<String> itensInseridos;

			if (session.getAttribute("itensInseridos") == null) {
				itensInseridos = new TreeSet<String>();
			} else {
				itensInseridos = (Set<String>) session.getAttribute("itensInseridos");
			}

			Item unidade;
			int i;
			
			if (nProduto == null) {
				i = Integer.parseInt(request.getParameter("seqProduto"));
			}	else {
				i = Integer.parseInt(nProduto);
			}

			if ((produto.get(i).getQtd() > itensInseridos.size()) || itensInseridos == null) {
				if (itensInseridos.add(numSerie) == true) {
					System.out.println(numSerie);

					session.setAttribute("nProduto", String.valueOf(i));
					
					session.setAttribute("itensInseridos",itensInseridos);

					if (itensInseridos.size() == produto.get(i).getQtd()) {
						List<Item> itens = new ArrayList<Item>();
						List<String> itensNS = new ArrayList<String>();
						itensNS.addAll(itensInseridos);
						
						for (int z = 0; z < produto.get(i).getQtd(); z++) {
							
							unidade = new Item(produto.get(i), itensNS.get(z), nf1);
							itens.add(unidade);
							
						}
						
						Set<Integer> posicao;
						if (session.getAttribute("posicao") == null) {
							posicao = new TreeSet<Integer>();
						} else {
							posicao = (Set<Integer>) session.getAttribute("posicao");
						}
						
						posicao.add(i);
						session.setAttribute("posicao", posicao);
						session.removeAttribute("itensInseridos");
						session.removeAttribute("nProduto");
						nf1.setItems(itens);
						session.setAttribute("itens", nf1.getItems());

						System.out.println(nf1.getItems().get(0).getNumeroDeSerie());
						System.out.println(posicao);
						
						response.sendRedirect("SelecionaProduto.jsp");
					} else {
						
						response.sendRedirect("InsereProduto.jsp");
					}
				} else {
					session.setAttribute("erro", "Número de Série já existe, Por Favor digite um Número Diferente.");
					response.sendRedirect("InsereProduto.jsp");
				}
			}
		}
			
	}

}
