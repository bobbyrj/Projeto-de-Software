package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Object.Item;
import Object.NotaFiscal;
import Object.Produto;
import Object.Usuario;

/**
 * Servlet implementation class trocaItem
 */
public class trocaItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public trocaItem() {
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
		String nserie = (String) request.getParameter("nSerie");
		List<String> idprod = Usuario.listaNS(nserie);
		
		if (idprod != null) {
			session.setAttribute("codigoProd", idprod.get(0).split("-")[0]);
			session.setAttribute("nSerie", idprod.get(0).split("-")[1]);
			session.setAttribute("nf", idprod.get(0).split("-")[2]);
			session.setAttribute("idnf", idprod.get(1));
			
			response.sendRedirect("completaTroca.jsp");		
		} else {
			response.sendRedirect("erroBD.jsp");
		}	
		
		
		
	}

}
