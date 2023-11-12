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
import java.util.List;

public class UserList implements Action {
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection connection = ConnectionFactory.getConnection();
        UserDAO userDAO = new UserDAOImpl(connection);
        List<User> userList = userDAO.userList();

        // Definindo objeto de usuário como um atributo de solicitação
        request.setAttribute("users", userList);

        // enviar uma resposta de volta para user-added.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/user-list.jsp");
        dispatcher.forward(request, response);
    }
}
