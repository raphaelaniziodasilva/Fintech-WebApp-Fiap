<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carteira</title>

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
<body class="container">
    <header style="background-color: #2A867D;" class="text-white grid place-content-center p-6 pb-3 text-center">
        <h1 class="text-6xl font-bold uppercase">Fintech</h1>
        <h2 class="mt-1 text-2xl">Sua economia começa agora</h2>
        <img class="mt-8 mx-auto scale-150" src="./assets/icons/logo.svg" alt="Logo"></img>
    </header>

    <main class="p-5">
        <section class="grid grid-cols-[repeat(auto-fit,minmax(8.125rem,16rem))] gap-5 place-content-start sm:place-content-center">
            <h1 class="text-4xl font-bold mb-4">Carteira</h1>
            <h3 class="text-lg mb-6">Monitore a sua vida financeira e faça sua economia</h3>

            <div class="flex flex-wrap justify-center gap-4">
                <a href="create-wallet.jsp" class="grid bg-zinc-300 place-items-center gap-3 p-4 rounded">
                    <img class="pointer-events-none" src="./assets/icons/wallet.svg" alt="Wallet"></img>
                    <span class="font-medium">Criar carteira</span>
                </a>
                <a href="add-expenses.jsp" class="grid bg-zinc-300 place-items-center gap-3 p-4 rounded">
                    <img class="pointer-events-none" src="./assets/icons/calc.svg" alt="Calc"></img>
                    <span class="font-medium">Adicione gastos</span>
                </a>
                <a href="controladora?acao=WalletList" class="grid bg-zinc-300 place-items-center gap-3 p-4 rounded">
                    <img class="pointer-events-none" src="./assets/icons/list.svg" alt="List"></img>
                    <span class="font-medium">Lista de carteiras</span>
                </a>
                <a href="create-investment.jsp" class="grid bg-zinc-300 place-items-center gap-3 p-4 rounded">
                    <img class="pointer-events-none" src="./assets/icons/money.svg" alt="Money"></img>
                    <span class="font-medium">Criar investimento</span>
                </a>
                <a href="controladora?acao=InvestmentList" class="grid bg-zinc-300 place-items-center gap-3 p-4 rounded">
                    <img class="pointer-events-none" src="./assets/icons/money.svg" alt="Money"></img>
                    <span class="font-medium">Listar investimentos</span>
                </a>
            </div>
        </section>
    </main>
</body>
</html>
