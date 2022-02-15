//Nicolas Seroiska ht1910213

package model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Usuario {
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	//@Column(name="descricao_tarefa")
	private String nome;
	private String sobrenome;
	private String email;
	private String senha;
	private Date nasc;
	private int pontos_vida;
	private int pontos_fire;
	private int pontos_coroa;
	
	public Usuario() {super();}
	
	public Usuario(int id, String nome, String sobrenome, Date nasc, String email, String senha) {
		super();
		this.id = id;
		this.nome = nome;
		this.sobrenome = sobrenome;
		this.email = email;
		this.senha = senha;
		this.nasc = nasc;
		
		pontos_vida = 5;
		pontos_coroa = 5;
		pontos_fire = 0;
		
	}
	
	public Usuario(String nome, String sobrenome, Date nasc, String email, String senha) {
		super();
		this.nome = nome;
		this.sobrenome = sobrenome;
		this.email = email;
		this.senha = senha;
		this.nasc = nasc;
		
		pontos_vida = 5;
		pontos_coroa = 5;
		pontos_fire = 0;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getSobrenome() {
		return sobrenome;
	}

	public void setSobrenome(String sobrenome) {
		this.sobrenome = sobrenome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public Date getNasc() {
		return nasc;
	}

	public void setNasc(Date nasc) {
		this.nasc = nasc;
	}

	public int getPontos_vida() {
		return pontos_vida;
	}

	public void setPontos_vida(int pontos_vida) {
		this.pontos_vida = pontos_vida;
	}

	public int getPontos_fire() {
		return pontos_fire;
	}

	public void setPontos_fire(int pontos_fire) {
		this.pontos_fire = pontos_fire;
	}

	public int getPontos_coroa() {
		return pontos_coroa;
	}

	public void setPontos_coroa(int pontos_coroa) {
		this.pontos_coroa = pontos_coroa;
	}

	public int getId() {
		return id;
	}
	
	

}
