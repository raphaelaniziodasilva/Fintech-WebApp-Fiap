package br.com.fiap.fintech.actions;

import org.fiap.com.br.dao.InvestimentDAO;
import org.fiap.com.br.dao.InvestimentDAOImpl;
import org.fiap.com.br.database.ConnectionFactory;
import org.fiap.com.br.entity.Investment;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

public class InvestmentList implements Action {
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection connection = ConnectionFactory.getConnection();
            InvestimentDAO investimentDAO = new InvestimentDAOImpl(connection);
            List<Investment> investmentList = investimentDAO.investmentList();

            request.setAttribute("investments", investmentList);

            RequestDispatcher dispatcher = request.getRequestDispatcher("/investment-list.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }

        // http://localhost:8080/Fintech-WebApp/controladora?acao=InvestmentList
    }
}
