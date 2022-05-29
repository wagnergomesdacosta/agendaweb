package br.com.cotiinformatica.entities;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Tarefa {
	
	private Integer idTarefa;
	private String nome;
	private String descricao;
	private Date data;
	private String hora; 
	private Integer prioridade;
	private Integer idUsuario;
	
	//associação ter-1
	private Usuario usuario;

}
