<%@ page import="org.fiap.com.br.entity.Investment" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Atualizar investimento</title>

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
            String investmentCode = request.getParameter("code");
            String investmentDate = request.getParameter("investmentDate");
            String investmentName = request.getParameter("name");
            String investmentValue = request.getParameter("value");
            String investmentPercentage = request.getParameter("percentage");
        %>

        <% if (request.getAttribute("errorMessage") != null) { %>
            <div style="color: red;">
                <strong><%= request.getAttribute("errorMessage") %></strong>
            </div>
        <% } %>

        <form action="controladora" method="POST">
            <fieldset>
                <legend>Atualizar Carteira</legend>

                <label><strong>Código</strong></label>
                <input type="number" name="code" value="<%= (investmentCode != null) ? investmentCode : "" %>" required>
                <hr/>

                <label><strong>Data de investimento</strong></label>
                <input type="text" name="investmentDate" value="<%= (investmentDate != null) ? investmentDate : "" %>" required>
                <hr/>

                <label><strong>Nome do investimento</strong></label>
                <input type="text" name="name" value="<%= (investmentName != null) ? investmentName : "" %>" required>
                <hr/>

                <label><strong>Valor</strong></label>
                <input type="number" name="value" value="<%= (investmentValue != null) ? investmentValue : "" %>" required>
                <hr/>

                <label><strong>Porcentagem</strong></label>
                <input type="number" name="percentage" value="<%= (investmentPercentage != null) ? investmentPercentage : "" %>" required>
                <hr/>
            </fieldset>
            <input type="hidden" name="acao" value="UpdateInvestiment">
            <input type="submit" value="Atualizar">
        </form>
    </main>
</body>
</html>
