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
import java.sql.Connection;
import java.util.List;

public class WalletList implements Action {
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection connection = ConnectionFactory.getConnection();
        WalletDAO walletDAO = new WalletDAOImpl(connection);
        List<Wallet> walletList = walletDAO.walletList();

        request.setAttribute("wallets", walletList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/wallet-list.jsp");
        dispatcher.forward(request, response);

        // http://localhost:8080/Fintech-WebApp/controladora?acao=WalletList
    }
}
