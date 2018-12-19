package Servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;
import javax.xml.namespace.NamespaceContext;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPathExpressionException;


import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import javax.xml.parsers.*;
import java.io.*;



import Object.Arquivo;
import Object.NotaFiscal;
import Object.Produto;

/**
 * Servlet implementation class uploadArq
 */
public class uploadArq extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public uploadArq() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public List<Produto> converteXml (NotaFiscal nf1) {
		
		
		NodeList nList = nodePelaTag("ide");
				
		for (int temp = 0; temp < nList.getLength(); temp++)
		{
		 org.w3c.dom.Node node = nList.item(temp);
		 //System.out.println("");    //Just a separator
		 if (node.getNodeType() == Node.ELEMENT_NODE)
		 {
		    //Print each employee's detail
		    Element eElement = (Element) node;
		    nf1.setModelo(eElement.getElementsByTagName("mod").item(0).getTextContent());
		    nf1.setSerie(eElement.getElementsByTagName("serie").item(0).getTextContent());
		    nf1.setNumero(eElement.getElementsByTagName("nNF").item(0).getTextContent());
		    nf1.setDataVenda(eElement.getElementsByTagName("dhEmi").item(0).getTextContent());
		    
		    	    
		 }
		}
		
		nList = nodePelaTag("prod");
		List<Produto> Itens = new ArrayList<Produto>(); 
		
		for (int temp = 0; temp < nList.getLength(); temp++)
		{
		 org.w3c.dom.Node node = nList.item(temp);
		 
		 //System.out.println("");    //Just a separator
		 if (node.getNodeType() == Node.ELEMENT_NODE)
		 {
		    //Print each employee's detail
		    Element eElement = (Element) node;
		    String codigo = eElement.getElementsByTagName("cProd").item(0).getTextContent();
		    String descricao = eElement.getElementsByTagName("xProd").item(0).getTextContent();
		    String quantidade = eElement.getElementsByTagName("qCom").item(0).getTextContent();		 
		    Float qtd = Float.parseFloat(quantidade.split(",")[0]);

		    Produto produto = new Produto();
		    produto.setCodigoProduto(codigo);
		    produto.setDescricao(descricao);
		    //produto.setQtd((int) Math.abs(qtd));
		    produto.setQtd(2);
		   
		    
		    
		    Itens.add(produto); 
		 }
		}
		//nf1.setItems(Itens);
		nf1.setId();				
		
		return Itens;
	}
	public NodeList nodePelaTag(String nomeTag) {
			
		try {
			//Get Document Builder
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
			 
			//Build Document
			Document document = builder.parse(new File("C:/a/nfe1.xml"));
			 
			//Normalize the XML Structure; It's just too important !!
			document.getDocumentElement().normalize();
			 
			//Here comes the root node
			Element root = document.getDocumentElement();
			System.out.println(root.getNodeName());
			
			NodeList nList = document.getElementsByTagName(nomeTag);
			
			return nList;
						
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;	
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
		String tipo = "";
		HttpSession session = request.getSession();
		boolean teste = ServletFileUpload.isMultipartContent(request);
		try {
			String tipoarq="";
			String camArq = "";
			if (teste) {
				FileItemFactory a = new DiskFileItemFactory();
				ServletFileUpload arqcar = new ServletFileUpload(a);
				List campos = arqcar.parseRequest(request);
				Iterator j = campos.iterator();
				while (j.hasNext()) {
					FileItem arq = (FileItem) j.next();
					if (arq.getFieldName().equals("arquivo")) {
						tipo = arq.getName();

						String nomearq[]=tipo.split("\\\\");
						tipoarq = nomearq[nomearq.length-1];
						break;
					}
				}
				Iterator i = campos.iterator();
				while (i.hasNext()) {
					FileItem arq = (FileItem) i.next();
					if (!(arq.isFormField())) {
						if (arq.getName().length() > 0) {
							Arquivo grava = new Arquivo();
							String caminho = "C:/a";// colocar
							// caminho
							// da
							// aplicação
							// ou
							// ip
							// do
							// servidor
							// de
							// arquivos
							camArq = grava.guardaArquivo(arq, "/nfe1.xml",caminho);
						}
					}
				}
				String caminhoServlet = camArq;
				//session.setAttribute("caminho", caminhoServlet);
				//CaminhoBD c = new CaminhoBD();
				//c.addCaminho(caminhoServlet);
				//session.setAttribute("aviso", "Sucesso no upload!");
				
				NotaFiscal nf = new NotaFiscal();
				
				List<Produto> produto = converteXml(nf);
				
				HttpSession sessao = request.getSession();		
				
				sessao.setAttribute("prod", produto);
				sessao.setAttribute("nf", nf);
				
				response.sendRedirect("InsereProduto.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}


