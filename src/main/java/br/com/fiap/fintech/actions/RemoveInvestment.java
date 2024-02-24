package br.com.fiap.fintech.actions;

import org.fiap.com.br.dao.InvestimentDAO;
import org.fiap.com.br.dao.InvestimentDAOImpl;
import org.fiap.com.br.dao.WalletDAO;
import org.fiap.com.br.dao.WalletDAOImpl;
import org.fiap.com.br.database.ConnectionFactory;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

public class RemoveInvestment implements Action {
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int code = Integer.parseInt(request.getParameter("code"));

            Connection connection = ConnectionFactory.getConnection();
            InvestimentDAO investimentDAO = new InvestimentDAOImpl(connection);
            investimentDAO.remove(code);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/controladora?acao=InvestmentList");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
