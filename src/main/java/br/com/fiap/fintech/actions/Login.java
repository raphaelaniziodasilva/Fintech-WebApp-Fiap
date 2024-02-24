package br.com.fiap.fintech.actions;

import org.fiap.com.br.dao.UserDAO;
import org.fiap.com.br.dao.UserDAOImpl;
import org.fiap.com.br.database.ConnectionFactory;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

public class Login implements Action {
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Connection connection = ConnectionFactory.getConnection();
        UserDAO userDAO = new UserDAOImpl(connection);
        String loginResult = userDAO.login(email, password);

        if (loginResult.equals("Login bem-sucedido")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/carteira.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("index.jsp?error=true");
        }
    }
}
