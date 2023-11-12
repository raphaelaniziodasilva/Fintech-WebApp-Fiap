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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CreatUser implements Action {
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // pegando os inputs do formulário e fazendo a conversão de tipo
        int code = Integer.parseInt(request.getParameter("code"));
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String rg = request.getParameter("rg");
        String cpf = request.getParameter("cpf");
        String dateOfBirthStr = request.getParameter("dateOfBirth");
        String cellPhone = request.getParameter("cellPhone");
        String telephone = request.getParameter("telephone");
        String cellPhone1 = request.getParameter("cellPhone1");
        String telephone1 = request.getParameter("telephone1");

        // Formatando a data para o padrão brasil
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        Date dateOfBirth = null;
        try {
            dateOfBirth = dateFormat.parse(dateOfBirthStr);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        // Criando usuario
        User user = new User(code, name, surname, rg, cpf, dateOfBirth, cellPhone, telephone, cellPhone1, telephone1);

        Connection connection = ConnectionFactory.getConnection();

        // Criando a instância do userDAO e implementada UserDAOImpl
        UserDAO userDAO = new UserDAOImpl(connection);

        // inserindo o usuário no banco de dados
        userDAO.create(user);

        // Definindo objeto de usuário como um atributo de solicitação
        request.setAttribute("user", user);

        // enviar uma resposta de volta para user-added.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/user-added.jsp");
        dispatcher.forward(request, response);
    }
}
