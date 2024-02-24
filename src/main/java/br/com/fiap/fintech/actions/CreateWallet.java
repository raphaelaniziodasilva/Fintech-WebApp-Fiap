package br.com.fiap.fintech.actions;

import org.fiap.com.br.dao.WalletDAO;
import org.fiap.com.br.dao.WalletDAOImpl;
import org.fiap.com.br.database.ConnectionFactory;
import org.fiap.com.br.entity.Wallet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;

public class CreateWallet implements Action {
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Pegando os inputs do formulário e fazendo a conversão de tipo
        int code = Integer.parseInt(request.getParameter("code"));
        int userCode = Integer.parseInt(request.getParameter("userCode"));
        String name = request.getParameter("name");
        double balance = Double.parseDouble(request.getParameter("balance"));

        Wallet wallet = new Wallet(code, userCode, name, balance);

        Connection connection = ConnectionFactory.getConnection();

        // Criando a instância do WalletDAO e implementando WalletDAOImpl
        WalletDAO walletDAO = new WalletDAOImpl(connection);

        // Adicionando a carteira no banco de dados
        walletDAO.create(wallet);

        // Definindo objeto de carteira como um atributo de solicitação
        request.setAttribute("wallet", wallet);

        // Enviar uma resposta de volta para wallet-added.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("/wallet-added.jsp");
        dispatcher.forward(request, response);
    }
}
