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
import java.util.List;

/**
 *
 * @author logonpf
 */
public class Conectar {
    private static Connection conexao = null;
    private static PreparedStatement preparedStatement = null;
    private static ResultSet resultSet = null;

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
        }
        catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
    
    public static ResultSet buscarRegistro(String tabela, List<String> campos, List<String> valores) {
        return buscarRegistro(tabela, campos, valores, "AND");
    }

    public static ResultSet buscarRegistro(String tabela, List<String> campos, List<String> valores, String uniaoWhere) {
        String sql = "SELECT * FROM " + tabela + " WHERE ";

        for (int i = 0; i < campos.size(); i++) {
            String campo = campos.get(i);
            String valor = valores.get(i);

            sql += campo + " LIKE '" + valor + "'";

            if (i < campos.size() - 1)
                sql += " " + uniaoWhere + " ";
        }

        System.out.println(sql);

        conexao = Conectar.iniciarConexao();

        resultSet = null;

        try {
            preparedStatement = conexao.prepareStatement(sql);

            resultSet = preparedStatement.executeQuery();
        }
        catch (Exception e) {
            System.out.println(e);
        }

        return resultSet;
    }

    public static int pegarQuantidadeResultados(ResultSet resultSet) {
        int quantidadeResultados = 0;

        try {
            if (resultSet.last()) {
                quantidadeResultados = resultSet.getRow();
                resultSet.beforeFirst();
            }
        }
        catch (Exception e) {
            System.out.println(e);
        }

        return quantidadeResultados;
    }
}
