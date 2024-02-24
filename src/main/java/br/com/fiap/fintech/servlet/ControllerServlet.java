package br.com.fiap.fintech.servlet;

import br.com.fiap.fintech.actions.Action;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/controladora")
public class ControllerServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String actionName = request.getParameter("acao");

            if (actionName == null || actionName.isEmpty()) {
                // Tratar ação inválida ou ausente
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Ação não especificada");
                return;
            }

            String pacote = "br.com.fiap.fintech.actions.";
            System.out.println("Ação executada:" + actionName);

            Class<? extends Action> classe = Class.forName(pacote + actionName).asSubclass(Action.class);
            Action action = classe.getDeclaredConstructor().newInstance();

            action.execute(request, response);
        } catch (Exception e) {
            // Logar ou redirecionar a exceção
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro interno");
        }
    }
}
