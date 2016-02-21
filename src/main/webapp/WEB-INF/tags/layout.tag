<%@tag description="User Page template" pageEncoding="UTF-8"%>
<%@ attribute name="header" fragment="true"%>
<%@ attribute name="topo" fragment="true"%>
<%@ attribute name="footer" fragment="true"%>
<html>
    <head>
        <jsp:invoke fragment="header"/>
    </head>
    <body>
        <div id="topo">
            <jsp:invoke fragment="topo"/>
        </div>
        <div id="body">
            <jsp:doBody/>
        </div>
        <div id="footer">
            <jsp:invoke fragment="footer"/>
        </div>
    </body>
</html>