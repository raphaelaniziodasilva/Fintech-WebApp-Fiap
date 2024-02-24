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

public class UpdateWallet implements Action {
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int code = Integer.parseInt(request.getParameter("code"));
            int userCode = Integer.parseInt(request.getParameter("userCode"));
            String name = request.getParameter("name");
            double balance = Double.parseDouble(request.getParameter("balance"));

            Connection connection = ConnectionFactory.getConnection();
            WalletDAO walletDAO = new WalletDAOImpl(connection);

            // Buscar a carteira pelo código
            Wallet wallet = walletDAO.searchWalletCode(code);

            if (wallet != null) {
                // Atualizar os dados da carteira no banco de dados
                wallet.setUserCode(userCode);
                wallet.setName(name);
                wallet.setBalance(balance);
                walletDAO.update(wallet);
            }

            request.setAttribute("wallet", wallet);

            // Redirecionar para a lista de carteiras
            RequestDispatcher dispatcher = request.getRequestDispatcher("controladora?acao=WalletList");
            dispatcher.forward(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Ocorreu um erro ao atualizar a carteira");
            RequestDispatcher dispatcher = request.getRequestDispatcher("update-wallet.jsp?error=true");
            dispatcher.forward(request, response);
        }
    }
}
