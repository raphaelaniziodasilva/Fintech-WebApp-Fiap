<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adicionar Investimento</title>

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

    <main class="w-full sm:w-1/3 md:w-1/1 lg:w-1/1 xl:w-1/1 mx-auto">
        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="text-red-500">
                <%= request.getAttribute("errorMessage") %>
            </div>
        <% } %>

        <form action="controladora" method="POST" class="bg-white p-8 rounded shadow-md">
            <fieldset>
                <legend class="text-xl font-semibold mb-4">Adicionar Investimento</legend>

                <label class="block text-sm font-medium text-gray-700">Código</label>
                <input type="number" name="code" required class="w-full border rounded-md px-3 py-2 mt-1 mb-4" placeholder="1">

                <label class="block text-sm font-medium text-gray-700">Data de Investimento</label>
                <input type="text" name="investmentDate" required class="w-full border rounded-md px-3 py-2 mt-1 mb-4" placeholder="01/01/2001">

                <label class="block text-sm font-medium text-gray-700">Nome do Investimento</label>
                <input type="text" name="name" required class="w-full border rounded-md px-3 py-2 mt-1 mb-4" placeholder="Nubank">

                <label class="block text-sm font-medium text-gray-700">Valor</label>
                <input type="number" name="value" required class="w-full border rounded-md px-3 py-2 mt-1 mb-4" placeholder="599">

                <label class="block text-sm font-medium text-gray-700">Porcentagem</label>
                <input type="number" name="percentage" required class="w-full border rounded-md px-3 py-2 mt-1 mb-4" placeholder="5%">
            </fieldset>

            <input type="hidden" name="acao" value="CreateInvestment">
            <input type="submit" value="Enviar" class="bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600">
        </form>
    </main>
</body>
</html>
