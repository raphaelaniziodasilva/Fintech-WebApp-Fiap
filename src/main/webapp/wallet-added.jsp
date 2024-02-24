<%@ page import="org.fiap.com.br.entity.Wallet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carteira Adicionada</title>

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Twinkle+Star&display=swap" rel="stylesheet">

    <!-- External Stylesheets -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
</head>
<body class"container">
    <header style="background-color: #2A867D;" class="text-white grid place-content-center p-6 pb-3 text-center">
        <h1 class="text-6xl font-bold uppercase">Fintech</h1>
        <h2 class="mt-1 text-2xl">Sua economia começa agora</h2>
        <img class="mt-8 mx-auto scale-150" src="./assets/icons/logo.svg"></img>
    </header>

    <main class="h-full grid place-content-center">
        <section class="bg-white p-8 rounded shadow-md w-96">
            <h2 class="text-2xl font-semibold mb-4">Carteira Adicionada</h2>

            <%
                Wallet wallet = (Wallet) request.getAttribute("wallet");
            %>

            <ul class="list-none p-0">
                <li class="mb-4">
                    <strong class="block text-sm font-medium text-gray-600">Código:</strong>
                    <span class="text-lg text-gray-800"><%= wallet.getCode() %></span>
                </li>

                <li class="mb-4">
                    <strong class="block text-sm font-medium text-gray-600">Código do usuário:</strong>
                    <span class="text-lg text-gray-800"><%= wallet.getUserCode() %></span>
                </li>

                <li class="mb-4">
                    <strong class="block text-sm font-medium text-gray-600">Nome:</strong>
                    <span class="text-lg text-gray-800"><%= wallet.getName() %></span>
                </li>

                <li class="mb-4">
                    <strong class="block text-sm font-medium text-gray-600">Saldo:</strong>
                    <span class="text-lg text-gray-800"><%= wallet.getBalance() %></span>
                </li>
            </ul>
        </section>
    </main>
</body>
</html>
