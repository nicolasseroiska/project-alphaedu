//Nicolas Seroiska ht1910213

package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Jogo {
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	//@Column(name="descricao_tarefa")
	private String palavra_correta;
	private String palavra_falsa1;
	private String palavra_falsa2;
	private String palavra_falsa3;

	
	public Jogo() {super();}
	
	public Jogo(int id, String palavra_correta, String palavra_falsa1, String palavra_falsa2, String palavra_falsa3) {
		super();
		this.id = id;
		this.palavra_correta = palavra_correta;
		this.palavra_falsa1 = palavra_falsa1;
		this.palavra_falsa2 = palavra_falsa2;
		this.palavra_falsa3 = palavra_falsa3;
		
	}
	
	public Jogo(String palavra_correta, String palavra_falsa1, String palavra_falsa2, String palavra_falsa3) {
		super();
		this.palavra_correta = palavra_correta;
		this.palavra_falsa1 = palavra_falsa1;
		this.palavra_falsa2 = palavra_falsa2;
		this.palavra_falsa3 = palavra_falsa3;
		
	}
	
	public String getPalavrac() {
		return palavra_correta;
	}
	
	public String getFalsa1() {
		return palavra_falsa1;
	}
	
	public String getFalsa2() {
		return palavra_falsa2;
	}
	
	public String getFalsa3() {
		return palavra_falsa3;
	}
	

	public int getId() {
		return id;
	}

}
