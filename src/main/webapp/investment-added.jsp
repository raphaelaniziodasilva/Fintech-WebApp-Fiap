<%@ page import="org.fiap.com.br.entity.Investment" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Investimento criado</title>

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
<body class"container">
    <header style="background-color: #2A867D;" class="text-white grid place-content-center p-6 pb-3 text-center">
        <h1 class="text-6xl font-bold uppercase">Fintech</h1>
        <h2 class="mt-1 text-2xl">Sua economia começa agora</h2>
        <img class="mt-8 mx-auto scale-150" src="./assets/icons/logo.svg"></img>
    </header>

    <main class="h-full grid place-content-center">
        <section class="bg-white p-8 rounded shadow-md w-full sm:w-1/1 md:w-1/1 lg:w-1/1 xl:w-1/1"> <!-- Ajuste da classe de largura para centralizar -->
            <h2 class="text-2xl mb-4">Investimento criado</h2>

            <%
                Investment investment = (Investment) request.getAttribute("investment");
            %>

            <ul class="list-none p-0">
                <li class="mb-4">
                    <strong>Código:</strong> <span class="border rounded-md p-2"><%= investment.getCode() %></span>
                </li>
                <hr class="my-4">

                <li class="mb-4">
                    <strong>Data de investimento:</strong> <span class="border rounded-md p-2"><%= new SimpleDateFormat("dd/MM/yyyy").format(investment.getInvestmentDate()) %></span>
                </li>
                <hr class="my-4">

                <li class="mb-4">
                    <strong>Nome:</strong> <span class="border rounded-md p-2"><%= investment.getName() %></span>
                </li>
                <hr class="my-4">

                <li class="mb-4">
                    <strong>Valor:</strong> <span class="border rounded-md p-2"><%= investment.getValue() %></span>
                </li>
                <hr class="my-4">

                <li class="mb-4">
                    <strong>% de Lucro:</strong> <span class="border rounded-md p-2"><%= investment.getPercentage() %></span>
                </li>
                <hr class="my-4">

                <li class="mb-4">
                    <strong>Lucro:</strong> <span class="border rounded-md p-2"><%= investment.getProfit() %></span>
                </li>
            </ul>
        </section>
    </main>
</body>
</html>
