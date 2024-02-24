<%@ page import="org.fiap.com.br.entity.User" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Usuário Criado</title>

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
        <div class="bg-white p-8 rounded shadow-md w-96">
            <h2 class="text-2xl font-semibold mb-4">Usuário criado</h2>
            <%
                User user = (User) request.getAttribute("user");
            %>

            <ul class="list-none p-0">
                <li class="mb-2">
                    <strong>Código:</strong> <%= user.getCode() %>
                </li>
                <li class="mb-2">
                    <strong>Email:</strong> <%= user.getEmail() %>
                </li>
                <li class="mb-2">
                    <strong>Senha:</strong> <%= user.getPassword() %>
                </li>
                <li class="mb-2">
                    <strong>Nome:</strong> <%= user.getName() %>
                </li>
                <li class="mb-2">
                    <strong>Sobrenome:</strong> <%= user.getSurname() %>
                </li>
                <li class="mb-2">
                    <strong>RG:</strong> <%= user.getRg() %>
                </li>
                <li class="mb-2">
                    <strong>CPF:</strong> <%= user.getCpf() %>
                </li>
                <li class="mb-2">
                    <strong>Data de Nascimento:</strong> <%= new SimpleDateFormat("dd/MM/yyyy").format(user.getDateOfBirth()) %>
                </li>
                <li class="mb-2">
                    <strong>Celular:</strong> <%= user.getCellPhone() %>
                </li>
                <li class="mb-2">
                    <strong>Telefone:</strong> <%= user.getTelephone() %>
                </li>
                <li class="mb-2">
                    <strong>Celular 1:</strong> <%= user.getCellPhone1() %>
                </li>
                <li class="mb-2">
                    <strong>Celular 2:</strong> <%= user.getTelephone1() %>
                </li>
            </ul>
            <p class="mt-2"><a href="controladora?acao=UserList" class="text-black-500" target="_blank">Clique aqui para ter acesso à lista de usuários existentes</a></p>

        </div>
    </main>
</body>
</html>
