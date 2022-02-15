// Nicolas Seroiska - ht1910213

package model;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

// Classe que ir� acessar o banco de dados.
public class JogoDAO {

	private EntityManagerFactory emf;

	public JogoDAO(EntityManagerFactory emf) {
		super();
		this.emf = emf;
	}
	
	public boolean excluirConjunto(int id) {

		EntityManager em = emf.createEntityManager();
		boolean result;
		try {

			Jogo jogo = em.find(Jogo.class, id);
			em.getTransaction().begin();
			
			em.remove(jogo);
			
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
	
	public Jogo procurarConjunto(int id) {

		Jogo jogo = null;
		EntityManager em = emf.createEntityManager();
		try {

			jogo = em.find(Jogo.class, id);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			em.close();

		}

		return jogo;

	}

	public List<Jogo> consultaJogos() {

		List<Jogo> listaJogos = new ArrayList<>();
		EntityManager em = emf.createEntityManager();
		try {

			listaJogos = em.createQuery("FROM " + Jogo.class.getName()).getResultList();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			em.close();

		}

		return listaJogos;

	}

	public boolean inserirJogo(String palavra_correta, String palavra_falsa1, String palavra_falsa2,
			String palavra_falsa3) {

		EntityManager em = emf.createEntityManager();

		boolean result;

		try {
			Jogo jogo = new Jogo(palavra_correta, palavra_falsa1, palavra_falsa2, palavra_falsa3);
			em.getTransaction().begin();
			em.persist(jogo);
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

}
