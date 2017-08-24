/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.copi;

import br.com.copi.conexao.Conectar;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author logonpf
 */
public class JavaSistemaBancario {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
	String tabela = "agencias";

	List<String> campos = new ArrayList<>();
        campos.add("nome");
        campos.add("numero");
	campos.add("ativo");

	List<String> valores = new ArrayList<>();
	valores.add("Lin");
	valores.add("1%");
	valores.add("1");

	ResultSet resultSet =
		Conectar.buscarRegistro(
			tabela,
			campos,
			valores
		);

	try {
		int quantidadeResultados = Conectar.pegarQuantidadeResultados(resultSet);

		System.out.println("A busca retornou " + quantidadeResultados + " resultado(s).");

		while (resultSet.next()) {
			String nome = resultSet.getString("nome");
			//String email = resultSet.getString("email");
			//boolean administrador = resultSet.getBoolean("administrador");

			System.out.println(nome);
			//System.out.println(email);
			//System.out.println(administrador);
		}
	}
	catch (Exception e) {
		System.out.println(e);
	}
    }
}
