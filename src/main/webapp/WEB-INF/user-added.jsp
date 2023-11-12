<%@ page import="org.fiap.com.br.entity.User" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Usuário criado</title>
    <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 20px;
            }

            h2 {
                color: #333;
            }

            table {
                width: 80%;
                margin: 20px 0;
                border-collapse: collapse;
                background-color: #fff;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            }

            th, td {
                padding: 15px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #4CAF50;
                color: white;
            }

            p {
                margin-top: 20px;
                color: #555;
            }
    </style>
</head>
<body>
    <h2>Usuário criado</h2>

    <%--Recuperando informações do usuário do atributo de solicitação --%>
    <%
        User user = (User) request.getAttribute("user");
    %>

    <%-- Exibindo informações do usuário --%>
    <table border="1">
        <tr>
            <th>Código</th>
                <th>Nome</th>
                <th>Sobrenome</th>
                <th>RG</th>
                <th>CPF</th>
                <th>Data de Nascimento</th>
                <th>Celular</th>
                <th>Telefone</th>
                <th>Celular 1</th>
                <th>Celular 2</th>
        </tr>
        <tr>
            <td><%= user.getCode() %></td>
            <td><%= user.getName() %></td>
            <td><%= user.getSurname() %></td>
            <td><%= user.getRg() %></td>
            <td><%= user.getCpf() %></td>
            <td><%= new SimpleDateFormat("dd/MM/yyyy").format(user.getDateOfBirth()) %></td>
            <td><%= user.getCellPhone() %></td>
            <td><%= user.getTelephone() %></td>
            <td><%= user.getCellPhone1() %></td>
            <td><%= user.getTelephone1() %></td>
        </tr>
    </table>
</body>
</html>
