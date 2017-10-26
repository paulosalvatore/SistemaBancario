/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.copi.conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author logonpf
 */
public class Conectar {

    private static Connection conexao = null;
    private static PreparedStatement preparedStatement = null;
    private static ResultSet resultSet = null;
    private static Statement statement = null;

    private static final String HOST = "localhost";
    private static final String PORTA = "3306";
    private static final String BANCO_DADOS = "sistema_bancario";
    private static final String USUARIO = "root";
    private static final String SENHA = "fiap";

    public static Connection iniciarConexao() {
        java.sql.Connection conexao = null;
        String driver = "com.mysql.jdbc.Driver";

        String url = "jdbc:mysql://"
                + HOST
                + ":"
                + PORTA
                + "/"
                + BANCO_DADOS;

        try {
            Class.forName(driver);
            conexao = DriverManager.getConnection(url, USUARIO, SENHA);
            return conexao;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

    public static boolean inserirRegistro(String tabela, List<String> colunas, List<String> valores) {
        String sql = "INSERT INTO " + tabela + "(";

        for (int chave = 0; chave < colunas.size(); chave++) {
            String coluna = colunas.get(chave);

            sql += coluna;

            if (chave < colunas.size() - 1) {
                sql += ", ";
            }

            System.out.println(sql);
        }

        sql += ") VALUES (";

        for (int chave = 0; chave < valores.size(); chave++) {
            String valor = valores.get(chave);

            sql += "'" + valor + "'";

            if (chave < valores.size() - 1) {
                sql += ", ";
            }

            System.out.println(sql);
        }

        sql += ");";

        System.out.println(sql);

        conexao = Conectar.iniciarConexao();

        try {
            statement = conexao.createStatement();
            statement.executeUpdate(sql);
            System.out.println("Registro adicionado com sucesso.");
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    public static void editarRegistro(String tabela, int id, List<String> colunas, List<String> valores) {
        String sql = "UPDATE " + tabela + " SET ";

        Date dataUtil = new Date();
        Timestamp dataSql = new Timestamp(dataUtil.getTime());
        String data = dataSql.toString();

        colunas.add("modificado");
        valores.add(data);

        for (int chave = 0; chave < colunas.size(); chave++) {
            String coluna = colunas.get(chave);
            String valor = valores.get(chave);

            sql += coluna + " = '" + valor + "'";

            if (chave < colunas.size() - 1) {
                sql += ", ";
            }

            System.out.println(sql);
        }

        sql += " WHERE id = " + id + ";";

        System.out.println(sql);

        conexao = Conectar.iniciarConexao();

        try {
            statement = conexao.createStatement();
            statement.executeUpdate(sql);
            System.out.println("Registro editado com sucesso.");
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public static void deletarRegistro(String tabela, int id) {
        List<String> colunas = new ArrayList<>();
        colunas.add("ativo");
        
        List<String> valores = new ArrayList<>();
        valores.add("0");
        
        editarRegistro(tabela, id, colunas, valores);
    }
}
