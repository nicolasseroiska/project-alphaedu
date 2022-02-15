// Nicolas Seroiska - ht1910213
package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Usuario;
import model.UsuarioDAO;

@WebServlet("/UsuarioController")
public class UsuarioController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UsuarioDAO usuarioDAO;

	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("teste-tcc");

	@Override
	public void init() throws ServletException {
		super.init();
		usuarioDAO = new UsuarioDAO(emf);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doGet");

		String acao = request.getParameter("acao");

		switch (acao) {
		case "listar": {
			listarUsuarios(request, response);
			break;
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + acao);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("doPost");
		
		String acao = request.getParameter("acao");
		acao = acao.toLowerCase();
			
		switch (acao) {
		case "cadastrar": {
			cadastrarUsuario(request, response);
			break;
		}
		case "buscar": {
			buscarUsuario(request, response);
			break;
		}
		case "excluir": {
			excluirUsuario(request, response);
			break;
		}
		case "logar": {
			realizaLogin(request, response);
			break;
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + acao);
		}
			
		
	}


	private void cadastrarUsuario(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		System.out.println("Controller: cadastrarUsuario");
		SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");  

		String email = request.getParameter("email");
		String email_confirmacao = request.getParameter("email_conf");
		String senha = request.getParameter("senha");
		String senha_confirmacao = request.getParameter("senha_conf");
		
		String verifica_errado = usuarioDAO.verifica(email, email_confirmacao, senha, senha_confirmacao);
		
		String nome = request.getParameter("nome");
		String sobrenome = request.getParameter("sobrenome");
		Date nasc = null;
		try {
			nasc = formato.parse(request.getParameter("nasc"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(verifica_errado == null) {
			boolean verifica = usuarioDAO.cadastrarUsuario(nome, sobrenome, nasc, email, senha);
			request.setAttribute("status", verifica);
			request.setAttribute("operacao", "cadastrado");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/status.jsp");
			dispatcher.forward(request, response);
		}
		else{
			request.setAttribute("status", false);
			request.setAttribute("operacao", "cadastrado");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/status.jsp");
			dispatcher.forward(request, response);	
		}
	}
	
	private void realizaLogin(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		System.out.println("Controller: realizaLogin");

		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		List<Usuario> listaUsuarios = new ArrayList<>();
		
		listaUsuarios = usuarioDAO.autenticaLogin(email, senha);
		
		if(listaUsuarios.size() != 0) {
			request.setAttribute("usuario", listaUsuarios.get(0));
			RequestDispatcher dispatcher = request.getRequestDispatcher("/aprenda.jsp");
			dispatcher.forward(request, response);
		}
		else{
			request.setAttribute("status", false);
			request.setAttribute("operacao", "logado");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/status.jsp");
			dispatcher.forward(request, response);	
		}
	}
	
	
	private void buscarUsuario(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		System.out.println("Controller: buscarUsuario");

		String nome_usuario = request.getParameter("nome_usuario");
		List<Usuario> listaUsuarios = new ArrayList<>();
		listaUsuarios = usuarioDAO.buscarUsuario(nome_usuario);
		
		request.setAttribute("lista_usuarios", listaUsuarios);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/view_usuarios.jsp");
		dispatcher.forward(request, response);

	}
	
	private void excluirUsuario(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		System.out.println("Controller: excluirUsuario");

		int id = Integer.parseInt(request.getParameter("id_usuario"));

		boolean excluiu = usuarioDAO.excluirUsuario(id);

		request.setAttribute("status", excluiu);
		request.setAttribute("operacao", "excluido");

		RequestDispatcher dispatcher = request.getRequestDispatcher("/status.jsp");
		dispatcher.forward(request, response);

	}

	private void listarUsuarios(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("Controller: listarUsuarios");

		List<Usuario> listaUsuarios = new ArrayList<>();
		listaUsuarios = usuarioDAO.listarUsuarios();

		// Adiciona lista de tarefas no objeto "request"
		request.setAttribute("lista_usuarios", listaUsuarios);

		// Cria o objeto de dispatcher e indica a p�gina que receber� a requisi��o
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view_usuarios.jsp");

		// Enviar a resposta para o JSP
		dispatcher.forward(request, response);
	}
}
