/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.copi;

import br.com.copi.conexao.Conectar;
import br.com.copi.telas.TelaLogin;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/**
 *
 * @author logonpf
 */
public class Principal {

    public static void main(String[] args) {
        //deletarAgencia();
        TelaLogin instanciaTelaLogin = new TelaLogin();
        instanciaTelaLogin.setVisible(true);
    }
    
    public static boolean adicionarAgencia(String numero, String nome) {
        String tabela = "agencias";

        List<String> colunas = new ArrayList<>();
        colunas.add("numero");
        colunas.add("nome");

        List<String> valores = new ArrayList<>();
        
        valores.add(numero);
        valores.add(nome);

        return Conectar.inserirRegistro(tabela, colunas, valores);
    }
    
    public static void editarAgencia() {
        String tabela = "agencias";

        List<String> colunas = new ArrayList<>();
        colunas.add("numero");
        colunas.add("nome");

        List<String> valores = new ArrayList<>();
        
        Scanner reader = new Scanner(System.in);
        
        System.out.println("Digite o ID da Agência que deseja editar:");
        int id = reader.nextInt();
        
        System.out.println("Digite o número da Agência:");
        String numero = reader.next();
        valores.add(numero);
        
        System.out.println("Digite o nome da Agência:");
        String nome = reader.next();
        valores.add(nome);

        Conectar.editarRegistro(tabela, id, colunas, valores);
    }
    
    public static void deletarAgencia() {
        String tabela = "agencias";
        
        Scanner reader = new Scanner(System.in);
        
        System.out.println("Digite o ID da Agência que deseja deletar:");
        int id = reader.nextInt();

        Conectar.deletarRegistro(tabela, id);
    }
}
