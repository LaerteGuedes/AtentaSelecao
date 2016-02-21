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
    </jsp:attribute>
     <jsp:attribute name="footer">

    </jsp:attribute>
  <jsp:body>
    <div class="container">
      <jsp:doBody/>
    </div>
  </jsp:body>
</t:layout>