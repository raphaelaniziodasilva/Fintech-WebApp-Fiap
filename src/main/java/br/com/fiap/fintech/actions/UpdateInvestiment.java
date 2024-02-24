package br.com.fiap.fintech.actions;

import org.fiap.com.br.dao.InvestimentDAO;
import org.fiap.com.br.dao.InvestimentDAOImpl;
import org.fiap.com.br.dao.WalletDAO;
import org.fiap.com.br.dao.WalletDAOImpl;
import org.fiap.com.br.database.ConnectionFactory;
import org.fiap.com.br.entity.Investment;
import org.fiap.com.br.entity.Wallet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UpdateInvestiment implements Action {
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

            Connection connection = ConnectionFactory.getConnection();
            InvestimentDAO investimentDAO = new InvestimentDAOImpl(connection);

            // Buscar a carteira pelo código
            Investment investment = investimentDAO.searchInvestmentCode(code);

            if (investment != null) {
                // Atualizar os dados da carteira no banco de dados
                investment.setInvestmentDate(investmentDate);
                investment.setName(name);
                investment.setValue(value);
                investment.setPercentage(percentage);
                investimentDAO.update(investment);
            }

            request.setAttribute("investment", investment);

            // Redirecionar para a lista de carteiras
            RequestDispatcher dispatcher = request.getRequestDispatcher("controladora?acao=InvestmentList");
            dispatcher.forward(request, response);

        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Ocorreu um erro ao atualizar a investimento");
            RequestDispatcher dispatcher = request.getRequestDispatcher("update-wallet.jsp?error=true");
            dispatcher.forward(request, response);
        }
    }
}
