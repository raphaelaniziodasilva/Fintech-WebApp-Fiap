<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.fiap.com.br.dao.UserDAOImpl" %>
<%@ page import="org.fiap.com.br.entity.User" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

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
        <section class="bg-white p-8 rounded shadow-md">
            <h2 class="text-2xl font-semibold mb-4 text-center">Login</h2>
            <p class="text-2xl font-semibold mb-4 text-center">Insira seus dados</p>

            <form action="controladora" method="POST">
                <div class="mb-4">
                    <label for="email" class="block text-sm font-medium text-gray-600">Email:</label>
                    <input type="text" id="email" name="email" class="mt-1 p-2 w-full border rounded-md" placeholder="Email">
                </div>

                <div class="mb-4">
                    <label for="password" class="block text-sm font-medium text-gray-600">Senha:</label>
                    <input type="password" id="password" name="password" class="mt-1 p-2 w-full border rounded-md" placeholder="Senha">
                </div>

                <input type="hidden" name="acao" value="Login">

                <button type="submit" class="bg-blue-500 text-white px-4 py-2 rounded-md">Login</button>
            </form>
            <p class="mt-4 text-center"><a href="create-user.jsp" class="text-black-500" target="_blank">Clique aqui para criar a sua conta</a></p>
        </section>
    </main>
</body>
</html>
