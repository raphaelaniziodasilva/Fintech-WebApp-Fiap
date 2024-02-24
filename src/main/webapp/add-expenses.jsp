<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adicionar Gastos</title>

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
        <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="text-red-500">
                <%= request.getAttribute("errorMessage") %>
            </div>
        <% } %>

        <form action="controladora" method="POST" class="bg-white p-8 rounded shadow-md w-96">
            <fieldset>
                <legend class="text-2xl font-semibold mb-4">Adicionar Gastos</legend>

                <div class="mb-4">
                    <label class="block text-sm font-medium text-gray-600">Código da carteira:</label>
                    <input type="number" name="code" class="mt-1 p-2 w-full border rounded-md" placeholder="1" required>
                </div>
                <hr class="my-4">

                <div class="mb-4">
                    <label class="block text-sm font-medium text-gray-600">Gastos da casa:</label>
                    <input type="number" name="home" class="mt-1 p-2 w-full border rounded-md" placeholder="500" required>
                </div>
                <hr class="my-4">

                <div class="mb-4">
                    <label class="block text-sm font-medium text-gray-600">Cartões:</label>
                    <input type="number" name="card" class="mt-1 p-2 w-full border rounded-md" placeholder="700" required>
                </div>
                <hr class="my-4">

                <div class="mb-4">
                    <label class="block text-sm font-medium text-gray-600">Outros gastos:</label>
                    <input type="number" name="other" class="mt-1 p-2 w-full border rounded-md" placeholder="200" required>
                </div>
                <hr class="my-4">
            </fieldset>
            <input type="hidden" name="acao" value="AddExpenses">
            <input type="submit" value="Enviar" class="bg-blue-500 text-white py-2 px-4 rounded-md hover:bg-blue-700">
        </form>
    </main>
</body>
</html>
