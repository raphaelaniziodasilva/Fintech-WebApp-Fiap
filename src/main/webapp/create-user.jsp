<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Criar Conta</title>

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
        <section class="bg-white p-8 rounded shadow-md w-96">
            <form action="controladora" method="POST" class="space-y-4">
                <div>
                    <label for="code" class="block text-sm font-medium text-gray-600">Código:</label>
                    <input type="number" id="code" name="code" class="mt-1 p-2 w-full border rounded-md" placeholder="Código" required>
                </div>

                <div>
                    <label for="email" class="block text-sm font-medium text-gray-600">Email:</label>
                    <input type="text" id="email" name="email" class="mt-1 p-2 w-full border rounded-md" placeholder="Email" required>
                </div>

                <div>
                    <label for="password" class="block text-sm font-medium text-gray-600">Senha:</label>
                    <input type="password" id="password" name="password" class="mt-1 p-2 w-full border rounded-md" placeholder="Senha" required>
                </div>

                <div>
                    <label for="name" class="block text-sm font-medium text-gray-600">Nome:</label>
                    <input type="text" id="name" name="name" class="mt-1 p-2 w-full border rounded-md" placeholder="Nome" required>
                </div>

                <div>
                    <label for="surname" class="block text-sm font-medium text-gray-600">Sobrenome:</label>
                    <input type="text" id="surname" name="surname" class="mt-1 p-2 w-full border rounded-md" placeholder="Sobrenome" required>
                </div>

                <div>
                    <label for="name" class="block text-sm font-medium text-gray-600">RG:</label>
                    <input type="text" id="rg" name="rg" class="mt-1 p-2 w-full border rounded-md" placeholder="RG" required>
                </div>

                <div>
                    <label for="surname" class="block text-sm font-medium text-gray-600">CPF:</label>
                    <input type="text" id="cpf" name="cpf" class="mt-1 p-2 w-full border rounded-md" placeholder="CPF" required>
                </div>

                <div>
                    <label for="name" class="block text-sm font-medium text-gray-600">Data de nascimento:</label>
                    <input type="text" id="dateOfBirth" name="dateOfBirth" class="mt-1 p-2 w-full border rounded-md" placeholder="01/01/2001" required>
                </div>

                <div>
                    <label for="surname" class="block text-sm font-medium text-gray-600">Número do celular:</label>
                    <input type="text" id="cellPhone" name="cellPhone" class="mt-1 p-2 w-full border rounded-md" placeholder="11 900000000" required>
                </div>

                <div>
                    <label for="name" class="block text-sm font-medium text-gray-600">Número de telefone:</label>
                    <input type="text" id="telephone" name="telephone" class="mt-1 p-2 w-full border rounded-md" placeholder="11 00000000" required>
                </div>

                <div>
                    <label for="surname" class="block text-sm font-medium text-gray-600">Número do celular 2:</label>
                    <input type="text" id="cellPhone1" name="cellPhone1" class="mt-1 p-2 w-full border rounded-md" placeholder="11 900000000" required>
                </div>

                <div>
                    <label for="name" class="block text-sm font-medium text-gray-600">Número de telefone 2:</label>
                    <input type="text" id="telephone1" name="telephone1" class="mt-1 p-2 w-full border rounded-md" placeholder="11 00000000" required>
                </div>

                <input type="hidden" name="acao" value="CreateUser">
                <input type="submit" value="Enviar" class="bg-blue-500 text-white py-2 px-4 rounded-md hover:bg-blue-700">
            </form>
        </section>
    </main>
</body>
</html>


