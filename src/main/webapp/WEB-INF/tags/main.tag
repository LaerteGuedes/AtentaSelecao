<%@tag description="User Page template" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@attribute name="title" required="true"%>

<t:layout>
    <jsp:attribute name="header">
        <title>Pagina - ${title}</title>
        <link rel="stylesheet" href="/resources/css/materialize/css/materialize.css"/>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script type="text/javascript" src="/resources/js/jquery-1.11.3.js"></script>
        <script type="text/javascript" src="/resources/css/materialize/js/materialize.js"></script>
        <script type="text/javascript" src="/resources/js/geral.js"></script>
        <script>
            $(function(){
                $(".button-collapse").sideNav();
                $('.button-collapse').sideNav({
                            menuWidth: 300, // Default is 240
                            edge: 'left', // Choose the horizontal origin
                            closeOnClick: true // Closes side-nav on <a> clicks, useful for Angular/Meteor
                        }
                );
            });

        </script>
    </jsp:attribute>
     <jsp:attribute name="footer">

    </jsp:attribute>
    <jsp:body>
        <nav>
            <ul id="slide-out" class="side-nav">
                <li><a href="/compra/lista">Lista geral de compras</a></li>
                <li><a href="/produto/lista">Lista de produtos na Geladeira</a></li>
                <li><a href="/login/logout">Sair</a></li>
            </ul>
            <a href="#" data-activates="slide-out" class="button-collapse show-on-large"><i class="mdi-navigation-menu"></i></a>

        </nav>
        <div class="container">
            <jsp:doBody/>
        </div>
    </jsp:body>
</t:layout>