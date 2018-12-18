package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Object.Item;
import Object.NotaFiscal;
import Object.Produto;

/**
 * Servlet implementation class insereBD
 */
public class insereBD extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insereBD() {
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
		String[] numSerie = (String[]) request.getParameterValues("nSerie");
		NotaFiscal nf1 = (NotaFiscal) session.getAttribute("nf");
		
		List<Item> itens = new ArrayList<Item>();
		Item unidade;
		
		for (int i=0, x=0; i < produto.size(); i++) {
			for (int z = 0; z < produto.get(i).getQtd(); z++,x++) {
				if (numSerie[x] != "") {
					unidade = new Item(produto.get(i), numSerie[x], nf1,false);
					itens.add(unidade);
				}
			}		
		
		}
		
		nf1.setItems(itens);
		
		for (int i=0; i<nf1.getItems().size();i++) {
			System.out.println(nf1.getItems().get(i).getNumeroDeSerie());
			System.out.println(nf1.getItems().get(i).getCodigoProduto());
		}
		
	}

}
