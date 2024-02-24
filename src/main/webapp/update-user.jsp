<%@ page import="org.fiap.com.br.entity.Wallet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Atualizar Usuário</title>

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
        <%
            String userCode = request.getParameter("code");
            String userEmail = request.getParameter("email");
            String userPassword = request.getParameter("password");
            String userName = request.getParameter("name");
            String userSurname = request.getParameter("surname");
            String userRg = request.getParameter("rg");
            String userCpf = request.getParameter("cpf");
            String userDateOfBirth = request.getParameter("dateOfBirth");
            String userCellPhone = request.getParameter("cellPhone");
            String userTelephone = request.getParameter("telephone");
            String userCellPhone1 = request.getParameter("cellPhone1");
            String userTelephone1 = request.getParameter("telephone1");
        %>

        <%@ page isErrorPage="false" %>

        <div style="color: red;">
            <%= request.getAttribute("errorMessage") %>
        </div>

        <form action="controladora" method="POST">
            <fieldset>
                <legend>Atualizar Usuário</legend>

                <label><strong>Código: </strong></label>
                <input type="number" name="code" value="<%= (userCode != null) ? userCode : "" %>" required>
                <hr/>

                <label><strong>Email: </strong></label>
                <input type="text" name="email" value="<%= (userEmail != null) ? userEmail : "" %>" required>
                <hr/>

                <label><strong>Senha: </strong></label>
                <input type="text" name="password" value="<%= (userPassword != null) ? userPassword : "" %>" required>
                <hr/>

                <label><strong>Nome:</strong></label>
                <input type="text" name="name" value="<%= (userName != null) ? userName : "" %>" required>
                <hr/>

                <label><strong>Sobrenome</strong></label>
                <input type="text" name="surname" value="<%= (userSurname != null) ? userSurname : "" %>" required>
                <hr/>

                <label><strong>RG</strong></label>
                <input type="text" name="rg" value="<%= (userRg != null) ? userRg : "" %>" required>
                <hr/>

                <label><strong>CPF</strong></label>
                <input type="text" name="cpf" value="<%= (userCpf != null) ? userCpf : "" %>" required>
                <hr/>

                <label><strong>Data de nascimento</strong></label>
                <input type="text" name="dateOfBirth" value="<%= (userDateOfBirth != null) ? userDateOfBirth : "" %>" required>
                <hr/>

                <label><strong>Número do celular</strong></label>
                <input type="text" name="cellPhone" value="<%= (userCellPhone != null) ? userCellPhone : "" %>" required>
                <hr/>

                <label><strong>Número de telefone</strong></label>
                <input type="text" name="telephone" value="<%= (userTelephone != null) ? userTelephone : "" %>" required>
                <hr/>

                <label><strong>Número do celular 2</strong></label>
                <input type="text" name="cellPhone1" value="<%= (userCellPhone1 != null) ? userCellPhone1 : "" %>">
                <hr/>

                <label><strong>Número de telefone 2</strong></label>
                <input type="text" name="telephone1" value="<%= (userTelephone1 != null) ? userTelephone1 : "" %>">
                <hr/>
            </fieldset>
            <input type="hidden" name="acao" value="UpdateUser">
            <input type="submit" value="Atualizar">
        </form>
    </main>
</body>
</html>
