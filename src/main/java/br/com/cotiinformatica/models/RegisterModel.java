package br.com.cotiinformatica.models;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RegisterModel {

	private String nome;
	private String email;
	private String senha;
	private String senhaConfirmacao;

}