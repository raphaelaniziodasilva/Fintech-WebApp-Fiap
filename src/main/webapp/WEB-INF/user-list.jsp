<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.fiap.com.br.entity.User" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Lista de Usuário</title>
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
</head>
<body>
    <h2>User List</h2>
    <table border="1">
        <tr>
            <th>Code</th>
            <th>Name</th>
            <th>Surname</th>
            <th>RG</th>
            <th>CPF</th>
            <th>Date of Birth</th>
            <th>Cell Phone</th>
            <th>Telephone</th>
            <th>Cell Phone 1</th>
            <th>Telephone 1</th>
        </tr>
        <% for (User user : (List<User>)request.getAttribute("users")) { %>
            <tr>
                <td><%= user.getCode() %></td>
                <td><%= user.getName() %></td>
                <td><%= user.getSurname() %></td>
                <td><%= user.getRg() %></td>
                <td><%= user.getCpf() %></td>
                <td><%= user.getDateOfBirth() %></td>
                <td><%= user.getCellPhone() %></td>
                <td><%= user.getTelephone() %></td>
                <td><%= user.getCellPhone1() %></td>
                <td><%= user.getTelephone1() %></td>
                <td><a href="controladora?acao=RemoveUser&code=<%= user.getCode() %>">Remover</a></td>
            </tr>
        <% } %>
    </table>
</body>
</html>
