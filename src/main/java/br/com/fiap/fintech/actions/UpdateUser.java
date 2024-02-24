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

public class UpdateUser implements Action {
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int code = Integer.parseInt(request.getParameter("code"));
            String email = request.getParameter("email");
            String password = request.getParameter("password");
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

            Connection connection = ConnectionFactory.getConnection();
            UserDAO userDAO = new UserDAOImpl(connection);

            // Buscar a carteira pelo código
            User user = userDAO.searchUserCode(code);

            if (user != null) {
                // Atualizar os dados do usuario no banco de dados
                user.setEmail(email);
                user.setPassword(password);
                user.setName(name);
                user.setSurname(surname);
                user.setRg(rg);
                user.setCpf(cpf);
                user.setDateOfBirth(dateOfBirth);
                user.setCellPhone(cellPhone);
                user.setTelephone(telephone);
                user.setCellPhone1(cellPhone1);
                user.setTelephone1(telephone1);
                userDAO.update(user);
            }

            request.setAttribute("user", user);

            // Redirecionar para a lista de usuários
            RequestDispatcher dispatcher = request.getRequestDispatcher("controladora?acao=UserList");
            dispatcher.forward(request, response);


        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Ocorreu um erro ao atualizar o usuário");
            RequestDispatcher dispatcher = request.getRequestDispatcher("update-user.jsp?error=true");
            dispatcher.forward(request, response);
        }
    }
}
