// Nicolas Seroiska - ht1910213
package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Jogo;
import model.JogoDAO;
import model.UsuarioDAO;
import model.Usuario;

@WebServlet("/JogoController")
@MultipartConfig(maxFileSize = 16177215) 
public class JogoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private JogoDAO jogoDAO;
	private UsuarioDAO usuarioDAO;

	private EntityManagerFactory emf = Persistence.createEntityManagerFactory("teste-tcc");

	@Override
	public void init() throws ServletException {
		super.init();
		jogoDAO = new JogoDAO(emf);
		usuarioDAO = new UsuarioDAO(emf);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doGet");

		String acao = request.getParameter("acao");

		switch (acao) {
		case "listar": {
			listarJogos(request, response);
			break;
		}
		case "jogar": {
			jogarJogo(request, response);
			break;
		}
		case "verificar": {
			verificarResultado(request, response);
			break;
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + acao);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("doPost");
		
		String palavrae = request.getParameter("palavrae");
		
		if(palavrae != null) {
			verificarResultado(request, response);
		}
		
		else {
			
			String acao = request.getParameter("acao");
			acao = acao.toLowerCase();
			
			switch (acao) {
			case "cadastrar": {
				cadastrarConjunto(request, response);
				break;
			}
			case "buscar": {
				buscarConjunto(request, response);
				break;
			}
			case "excluir": {
				excluirConjunto(request, response);
				break;
			}

			default:
				throw new IllegalArgumentException("Unexpected value: " + acao);
			}
			
		}
		
	}

	private void buscarConjunto(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		System.out.println("Controller: buscarConjunto");

		int id = Integer.parseInt(request.getParameter("id_conjunto"));
		Jogo jogo = new Jogo();
		jogo = jogoDAO.procurarConjunto(id);

		List<Jogo> listaJogo = new ArrayList();
		listaJogo.add(jogo);

		request.setAttribute("lista_jogos", listaJogo);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/view_jogos.jsp");
		dispatcher.forward(request, response);

	}

	private void cadastrarConjunto(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		System.out.println("Controller: cadastrarJogos");

		String palavra_correta = request.getParameter("palavra_correta");
		String palavra_falsa1 = request.getParameter("palavra_falsa1");
		String palavra_falsa2 = request.getParameter("palavra_falsa2");
		String palavra_falsa3 = request.getParameter("palavra_falsa3");
	
		
		boolean inseriu = jogoDAO.inserirJogo(palavra_correta, palavra_falsa1, palavra_falsa2, palavra_falsa3);

		request.setAttribute("status", inseriu);
		request.setAttribute("operacao", "inserido");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/status.jsp");
		dispatcher.forward(request, response);

	}

	private void excluirConjunto(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		System.out.println("Controller: buscarConjunto");

		int id = Integer.parseInt(request.getParameter("id_conjunto"));

		boolean excluiu = jogoDAO.excluirConjunto(id);

		request.setAttribute("status", excluiu);
		request.setAttribute("operacao", "excluido");

		RequestDispatcher dispatcher = request.getRequestDispatcher("/status.jsp");
		dispatcher.forward(request, response);

	}

	private void listarJogos(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("Controller: listarJogos");

		List<Jogo> listaJogos = new ArrayList<>();
		listaJogos = jogoDAO.consultaJogos();

		// Adiciona lista de tarefas no objeto "request"
		request.setAttribute("lista_jogos", listaJogos);

		// Cria o objeto de dispatcher e indica a p�gina que receber� a requisi��o
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view_jogos.jsp");

		// Enviar a resposta para o JSP
		dispatcher.forward(request, response);
	}
	
	// --------------------------------------------------------------------- // ------------------------------------------------------------------ //
	
	private void jogarJogo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Controller: jogarJogo");
		
		List<Jogo> listaJogos = new ArrayList<>();
		listaJogos = jogoDAO.consultaJogos();
		
		Random rand = new Random();
		// Adiciona lista de tarefas no objeto "request"
		if(listaJogos.size() == 1) {
			request.setAttribute("conjunto_rng", listaJogos.get(rand.nextInt(listaJogos.size())));
		}
		else {
			request.setAttribute("conjunto_rng", listaJogos.get(rand.nextInt(listaJogos.size() - 1)));
		}
		

		// Cria o objeto de dispatcher e indica a p�gina que receber� a requisi��o
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view_jogar.jsp");

		// Enviar a resposta para o JSP
		dispatcher.forward(request, response);
	}

	private void verificarResultado(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Controller: verificarResultado");
		
		String palavrac = request.getParameter("palavrac");
		String palavrae = request.getParameter("palavrae");
		
		boolean verifica = false;
		
		if(palavrac.equals(palavrae)) {
			verifica = true;
		}
		
		int usuario_id = Integer.parseInt(request.getParameter("usuario_id"));
		Usuario usuario = usuarioDAO.atualizarUsuario(usuario_id, verifica);
		
		// Adiciona lista de tarefas no objeto "request"
		request.setAttribute("feedback", verifica);
		request.setAttribute("usuario", usuario);

		// Cria o objeto de dispatcher e indica a p�gina que receber� a requisi��o
		RequestDispatcher dispatcher = request.getRequestDispatcher("/feedback.jsp");

		// Enviar a resposta para o JSP
		dispatcher.forward(request, response);
	}

	
}
