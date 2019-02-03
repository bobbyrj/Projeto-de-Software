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
 * Servlet implementation class ControleInsereProduto
 */
public class ControleInsereProduto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControleInsereProduto() {
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

		if ((produto.get(i).getQtd() > itensInseridos.size()) || itensInseridos.size() == 0) {
			if (itensInseridos.add(numSerie) == true) {
				System.out.println(numSerie);

				session.setAttribute("nProduto", String.valueOf(i));
				
				session.setAttribute("itensInseridos",itensInseridos);

				if (itensInseridos.size() == produto.get(i).getQtd()) {
					
					response.sendRedirect("controleCadastro");
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
