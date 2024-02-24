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


public class AddExpenses implements Action {
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int code = Integer.parseInt(request.getParameter("code"));
            double homeExpense = Double.parseDouble(request.getParameter("home"));
            double cardExpense = Double.parseDouble(request.getParameter("card"));
            double otherExpense = Double.parseDouble(request.getParameter("other"));

            double totalExpenses = homeExpense + cardExpense + otherExpense;

            Connection connection = ConnectionFactory.getConnection();
            WalletDAO walletDAO = new WalletDAOImpl(connection);

            // Buscar a carteira pelo código
            Wallet wallet = walletDAO.searchWalletCode(code);

            // Atualizar a despesa na carteira
            double expense = wallet.getExpenses();
            expense += totalExpenses;

            // Calcular a economia corretamente
            double balance = wallet.getBalance();
            double previousEconomy = wallet.getEconomy();
            double economy = balance - expense + previousEconomy;

            wallet.setExpenses(expense);
            wallet.setEconomy(economy);
            walletDAO.update(wallet);

            // Redirecionar para a lista de carteiras
            RequestDispatcher dispatcher = request.getRequestDispatcher("controladora?acao=WalletList");
            dispatcher.forward(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Os valores informados não são válidos");
            RequestDispatcher dispatcher = request.getRequestDispatcher("add-expenses.jsp?error=true");
            dispatcher.forward(request, response);
        }
    }
}
