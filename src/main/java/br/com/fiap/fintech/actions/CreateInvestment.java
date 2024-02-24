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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CreateInvestment implements Action {
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Pegando os inputs do formulário e fazendo a conversão de tipo
            int code = Integer.parseInt(request.getParameter("code"));
            String investmentDateSTR = request.getParameter("investmentDate");
            String name = request.getParameter("name");
            double value = Double.parseDouble(request.getParameter("value"));
            int percentage = Integer.parseInt(request.getParameter("percentage"));

            // Formatando a data para o padrão brasil
            SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
            Date investmentDate = null;
            try {
                investmentDate = dateFormat.parse(investmentDateSTR);
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }

            // Criando usuario
            Investment investment = new Investment(code, investmentDate, name, value, percentage);

            Connection connection = ConnectionFactory.getConnection();

            // Criando a instância do userDAO e implementada UserDAOImpl
            InvestimentDAO investimentDAO = new InvestimentDAOImpl(connection);

            // Cálculo do lucro do investimento
            double profit = investment.getProfit();
            profit += value * (percentage / 100.0);

            investment.setProfit(profit);

            // adicionando o usuário no banco de dados
            investimentDAO.create(investment);

            // Definindo objeto de usuário como um atributo de solicitação
            request.setAttribute("investment", investment);

            // enviar uma resposta de volta para user-added.jsp
            RequestDispatcher dispatcher = request.getRequestDispatcher("/investment-added.jsp");
            dispatcher.forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Erro ao criar investimento");
            RequestDispatcher dispatcher = request.getRequestDispatcher("create-investment.jsp?error=true");
            dispatcher.forward(request, response);
        }
    }
}
