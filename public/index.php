<?php 
    //habilitando exibir os erros
    ini_set('display_errors', 1);
    // ini_set('session.gc_maxlifetime', 30);

    // vai corrigir o problema do timezone, mudando para GMT-3
    date_default_timezone_set('America/Fortaleza');

    // habilitar o uso da variavel $_SESSION
    session_start();
    
    include '../src/utils/Security.php';

    //$url = explode('?', $_SERVER['REQUEST_URI'])[0];
    $url = parse_url($_SERVER['REQUEST_URI']);

    // PHP 8 >

    $view = match ($url['path']) {
        '/' => 'pages/home',
        '/sair' => 'pages/logout',
        // url    =>    caminho do html
        '/usuario/perfil' => 'pages/usuario/perfil',
        '/contatos/cadastro' => 'pages/contato/add',
        '/contatos/listar' => 'pages/contato/list',
        '/contatos/excluir' => 'pages/contato/delete',
        '/contatos/editar' => 'pages/contato/edit',
        '/login' => 'pages/login',
        '/cadastro' => 'pages/usuario/add',
        default => 'pages/notFound',
    };
    
    render($view); 

    function render(string $view): void
    {
        include '../src/components/head.phtml';
        
        if (true === hasLoggedUser()) {
            include '../src/components/menu.phtml';
        }

        include "../src/{$view}.phtml";
        include '../src/components/footer.phtml';
    }
?>
