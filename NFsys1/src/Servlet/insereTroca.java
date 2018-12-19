package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Object.Troca;
import Object.Usuario;

/**
 * Servlet implementation class insereTroca
 */
public class insereTroca extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insereTroca() {
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
		
		String codprod = (String) session.getAttribute("codigoProd");
		String devolvido = (String) session.getAttribute("nSerie");
		String nf = (String) session.getAttribute("nf");
		String motivo = (String) session.getAttribute("motivo");
		String nstroca = (String) session.getAttribute("nSerieTroca");
		
		Troca t1 = new Troca(motivo, nf, "codprod-"+ devolvido + "-"+nf, "codprod-"+ nstroca + "-"+nf);
		
		Usuario.addTroca(t1);
		
		System.out.println(codprod);
		System.out.println(nf);
		
		
	}

}
