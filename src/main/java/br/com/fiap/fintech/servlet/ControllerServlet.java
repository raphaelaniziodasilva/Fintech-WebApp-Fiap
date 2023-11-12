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
            String pacote = "br.com.fiap.fintech.actions.";
            System.out.println("Ação executada:" + actionName);

            Class classe = Class.forName(pacote + actionName);
            Action action = (Action) classe.newInstance();

            action.execute(request, response);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
