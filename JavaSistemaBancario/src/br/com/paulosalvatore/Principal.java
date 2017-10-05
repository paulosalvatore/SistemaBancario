/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.paulosalvatore;

import br.com.paulosalvatore.conexao.Conectar;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/**
 *
 * @author logonpf
 */
public class Principal {

    public static void main(String[] args) {
        String tabela = "agencias";

        List<String> colunas = new ArrayList<>();
        colunas.add("numero");
        colunas.add("nome");

        List<String> valores = new ArrayList<>();
        //valores.add("1516");
        //valores.add("Ibirapuera");
        
        Scanner reader = new Scanner(System.in);
        System.out.println("Digite o número da Agência:");
        String numero = reader.next();
        valores.add(numero);
        
        System.out.println("Digite o nome da Agência:");
        String nome = reader.next();
        valores.add(nome);

        Conectar.inserirRegistro(tabela, colunas, valores);
    }
}
