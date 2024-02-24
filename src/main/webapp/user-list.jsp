<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.fiap.com.br.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Usuário</title>

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Twinkle+Star&display=swap" rel="stylesheet">

    <!-- External Stylesheets -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <link rel="stylesheet" href="./styles/globals.css">
    <link rel="stylesheet" href="./styles/sign-up.css">

    <!-- Favicon -->
    <link rel="icon" href="./assets/icons/logo.svg">
</head>
<body class="bg-green-100 min-h-screen flex items-center justify-center">
    <main class="bg-white p-8 rounded shadow-md w-full overflow-x-auto">
        <table class="min-w-full border divide-y divide-green-300">
            <thead>
                <tr>
                    <th class="px-6 py-3 bg-green-400 text-left text-xs leading-4 font-medium text-gray-100 uppercase tracking-wider">Código</th>
                    <th class="px-6 py-3 bg-green-400 text-left text-xs leading-4 font-medium text-gray-100 uppercase tracking-wider">Email</th>
                    <th class="px-6 py-3 bg-green-400 text-left text-xs leading-4 font-medium text-gray-100 uppercase tracking-wider">Senha</th>
                    <th class="px-6 py-3 bg-green-400 text-left text-xs leading-4 font-medium text-gray-100 uppercase tracking-wider">Nome</th>
                    <th class="px-6 py-3 bg-green-400 text-left text-xs leading-4 font-medium text-gray-100 uppercase tracking-wider">Sobrenome</th>
                    <th class="px-6 py-3 bg-green-400 text-left text-xs leading-4 font-medium text-gray-100 uppercase tracking-wider">RG</th>
                    <th class="px-6 py-3 bg-green-400 text-left text-xs leading-4 font-medium text-gray-100 uppercase tracking-wider">CPF</th>
                    <th class="px-6 py-3 bg-green-400 text-left text-xs leading-4 font-medium text-gray-100 uppercase tracking-wider">Data de Nascimento</th>
                    <th class="px-6 py-3 bg-green-400 text-left text-xs leading-4 font-medium text-gray-100 uppercase tracking-wider">Celular</th>
                    <th class="px-6 py-3 bg-green-400 text-left text-xs leading-4 font-medium text-gray-100 uppercase tracking-wider">Telefone</th>
                    <th class="px-6 py-3 bg-green-400 text-left text-xs leading-4 font-medium text-gray-100 uppercase tracking-wider">Celular 1</th>
                    <th class="px-6 py-3 bg-green-400 text-left text-xs leading-4 font-medium text-gray-100 uppercase tracking-wider">Celular 2</th>
                    <th class="px-6 py-3 bg-green-400 text-left text-xs leading-4 font-medium text-gray-100 uppercase tracking-wider">Ações</th>
                </tr>
            </thead>
            <tbody class="bg-white divide-y divide-green-300">
                <% for (User user : (List<User>) request.getAttribute("userList")) { %>
                    <tr>
                        <td class="px-6 py-4 whitespace-no-wrap border"><%= user.getCode() %></td>
                        <td class="px-6 py-4 whitespace-no-wrap border"><%= user.getEmail() %></td>
                        <td class="px-6 py-4 whitespace-no-wrap border"><%= user.getPassword() %></td>
                        <td class="px-6 py-4 whitespace-no-wrap border"><%= user.getName() %></td>
                        <td class="px-6 py-4 whitespace-no-wrap border"><%= user.getSurname() %></td>
                        <td class="px-6 py-4 whitespace-no-wrap border"><%= user.getRg() %></td>
                        <td class="px-6 py-4 whitespace-no-wrap border"><%= user.getCpf() %></td>
                        <td class="px-6 py-4 whitespace-no-wrap border"><%= new SimpleDateFormat("dd/MM/yyyy").format(user.getDateOfBirth()) %></td>
                        <td class="px-6 py-4 whitespace-no-wrap border"><%= user.getCellPhone() %></td>
                        <td class="px-6 py-4 whitespace-no-wrap border"><%= user.getTelephone() %></td>
                        <td class="px-6 py-4 whitespace-no-wrap border"><%= user.getCellPhone1() %></td>
                        <td class="px-6 py-4 whitespace-no-wrap border"><%= user.getTelephone1() %></td>
                        <td class="px-6 py-4 whitespace-no-wrap border">
                            <a href="update-user.jsp?code=<%= user.getCode() %>&email=<%= user.getEmail() %>&password=<%= user.getPassword() %>&name=<%= user.getName() %>&surname=<%= user.getSurname() %>&rg=<%= user.getRg() %>&cpf=<%= user.getCpf() %>&dateOfBirth=<%= new SimpleDateFormat("dd/MM/yyyy").format(user.getDateOfBirth()) %>&cellPhone=<%= user.getCellPhone() %>&telephone=<%= user.getTelephone() %>&cellPhone1=<%= user.getCellPhone1() %>&telephone1=<%= user.getTelephone1() %>" class="text-blue-500 hover:underline">Editar</a>
                            <a href="controladora?acao=RemoveUser&code=<%= user.getCode() %>" class="text-red-500 hover:underline ml-2">Remover</a>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </main>
</body>
</html>
