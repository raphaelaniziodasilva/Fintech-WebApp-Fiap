package br.com.fiap.fintech.actions;

import org.fiap.com.br.dao.UserDAO;
import org.fiap.com.br.dao.UserDAOImpl;
import org.fiap.com.br.database.ConnectionFactory;
import org.fiap.com.br.entity.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;

public class RemoveUser implements Action {
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int code = Integer.parseInt(request.getParameter("code"));

        Connection connection = ConnectionFactory.getConnection();
        UserDAO userDAO = new UserDAOImpl(connection);
        userDAO.remove(code);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/controladora?acao=UserList");
        dispatcher.forward(request, response);
    }
}
