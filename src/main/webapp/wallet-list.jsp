<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.fiap.com.br.entity.Wallet" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de carteira</title>

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
    <main class="w-full md:w-2/3 lg:w-1/2 xl:w-1/2 mx-auto">
        <table class="min-w-full border divide-y divide-green-300 bg-white">
            <thead>
                <tr>
                    <th class="px-6 py-3 bg-green-400 text-left text-xs leading-4 font-medium text-gray-100 uppercase tracking-wider">Código</th>
                    <th class="px-6 py-3 bg-green-400 text-left text-xs leading-4 font-medium text-gray-100 uppercase tracking-wider">Código do usuário</th>
                    <th class="px-6 py-3 bg-green-400 text-left text-xs leading-4 font-medium text-gray-100 uppercase tracking-wider">Nome</th>
                    <th class="px-6 py-3 bg-green-400 text-left text-xs leading-4 font-medium text-gray-100 uppercase tracking-wider">Saldo</th>
                    <th class="px-6 py-3 bg-green-400 text-left text-xs leading-4 font-medium text-gray-100 uppercase tracking-wider">Despesas</th>
                    <th class="px-6 py-3 bg-green-400 text-left text-xs leading-4 font-medium text-gray-100 uppercase tracking-wider">Economia</th>
                    <th class="px-6 py-3 bg-green-400 text-left text-xs leading-4 font-medium text-gray-100 uppercase tracking-wider">Ações</th>
                </tr>
            </thead>
            <tbody>
                <% for (Wallet wallet : (List<Wallet>)request.getAttribute("wallets")) { %>
                    <tr>
                        <td class="px-6 py-4 whitespace-no-wrap border"><%= wallet.getCode() %></td>
                        <td class="px-6 py-4 whitespace-no-wrap border"><%= wallet.getUserCode() %></td>
                        <td class="px-6 py-4 whitespace-no-wrap border"><%= wallet.getName() %></td>
                        <td class="px-6 py-4 whitespace-no-wrap border"><%= wallet.getBalance() %></td>
                        <td class="px-6 py-4 whitespace-no-wrap border"><%= wallet.getExpenses() %></td>
                        <td class="px-6 py-4 whitespace-no-wrap border"><%= wallet.getEconomy() %></td>
                        <td class="px-6 py-4 whitespace-no-wrap border">
                            <a href="update-wallet.jsp?code=<%= wallet.getCode() %>&userCode=<%= wallet.getUserCode() %>&name=<%= wallet.getName() %>&balance=<%= wallet.getBalance() %>" class="text-blue-500 hover:underline">Editar</a>
                            <a href="controladora?acao=RemoveWallet&code=<%= wallet.getCode() %>" class="text-red-500 hover:underline ml-2">Remover</a>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </main>
</body>
</html>
