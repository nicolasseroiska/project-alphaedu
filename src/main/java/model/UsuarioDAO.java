// Nicolas Seroiska - ht1910213

package model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

// Classe que ir� acessar o banco de dados.
public class UsuarioDAO {

	private EntityManagerFactory emf;

	public UsuarioDAO(EntityManagerFactory emf) {
		super();
		this.emf = emf;
	}
	
	public boolean excluirUsuario(int id) {

		EntityManager em = emf.createEntityManager();
		boolean result;
		try {

			Usuario usuario = em.find(Usuario.class, id);
			em.getTransaction().begin();
			
			em.remove(usuario);
			
			em.getTransaction().commit();
			result = true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = false;
		} finally {
			em.close();

		}

		return result;

	}
	
	public String verifica(String email, String email_conf, String senha, String senha_conf) {
		EntityManager em = emf.createEntityManager();
		List<Usuario> listaUsuarios = new ArrayList<>();
		String errado = null;
		
		if(email.equals(email_conf)) {
			errado = null;
		}
		else {
			errado = "Os emails fornecidos possuem endereços diferentes";
			return errado;
		}
		
		if(senha.equals(senha_conf)) {
			errado = null;
		}
		else {
			errado = "A confirmação da senha não foi feita de forma efetiva";
			return errado;
		}
		
		Query query = em.createQuery("from " + Usuario.class.getName() + " where email = :x");
		query.setParameter("x", email);
		listaUsuarios = query.getResultList();
		
		if(listaUsuarios.size() > 0) {
			errado = "O email fornecido já foi cadastrado!";
		}
		
		return errado;
	}
	
	public List<Usuario> autenticaLogin(String email, String senha) {
		EntityManager em = emf.createEntityManager();
		List<Usuario> listaUsuarios = new ArrayList<>();
		
		Query query = em.createQuery("from " + Usuario.class.getName() + " where email = :x AND senha = :y");
		query.setParameter("x", email);
		query.setParameter("y", senha);
		listaUsuarios = query.getResultList();
		
		return listaUsuarios;
	}
	
	
	public List<Usuario> buscarUsuario(String nome_usuario) {

		EntityManager em = emf.createEntityManager();
		List<Usuario> listaUsuarios = new ArrayList<>();
		try {
			
			Query query = em.createQuery("from " + Usuario.class.getName() + " where nome like :x");
			query.setParameter("x", "%" + nome_usuario + "%");
			
			listaUsuarios = query.getResultList();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			em.close();
			//fecharConexao(myConn, statement, myResult);

		}
		
		return listaUsuarios;

	}

	public List<Usuario> listarUsuarios() {

		List<Usuario> listaUsuarios = new ArrayList<>();
		EntityManager em = emf.createEntityManager();
		try {

			listaUsuarios = em.createQuery("FROM " + Usuario.class.getName()).getResultList();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			em.close();

		}

		return listaUsuarios;

	}
	
	public boolean cadastrarUsuario(String nome, String sobrenome, Date nasc, String email, String senha) {

		EntityManager em = emf.createEntityManager();

		boolean result;

		try {
			Usuario usuario = new Usuario(nome, sobrenome, nasc, email, senha);
			em.getTransaction().begin();
			em.persist(usuario);
			em.getTransaction().commit();

			result = true;
		}

		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = false;
		}

		finally {
			em.close();
		}
		return result;

	}
	
	public Usuario atualizarUsuario(int usuario_id, boolean verifica) {
		
		EntityManager em = emf.createEntityManager();
		
		boolean result;
		List<Usuario> listaUsuarios = new ArrayList<>();
		Usuario usuario = new Usuario();
		try {
			
			Query query = em.createQuery("from " + Usuario.class.getName() + " where id = :x");
			query.setParameter("x", + usuario_id);
			
			listaUsuarios = query.getResultList();
			usuario = listaUsuarios.get(0);
			
			em.getTransaction().begin();
			
			if (verifica)
				usuario.setPontos_coroa(usuario.getPontos_coroa() + 5);	
			
			usuario.setPontos_vida(usuario.getPontos_vida() - 1);
			usuario.setPontos_fire(usuario.getPontos_fire());
			em.getTransaction().commit();

			query = em.createQuery("from " + Usuario.class.getName() + " where id = :x");
			query.setParameter("x", usuario_id);
			
			listaUsuarios = query.getResultList();
			usuario = listaUsuarios.get(0);
			
			result = true;
		}

		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = false;
		}

		finally {
			em.close();
		}
		return usuario;

	}
	
}
