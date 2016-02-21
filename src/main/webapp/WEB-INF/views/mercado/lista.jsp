<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:main title="Lista de Mercados">
  <div class="row">
    <div class="s12">
      <h2>Listagem de Mercados</h2>
      <table class="bordered">
        <tr>
          <th>Id</th>
          <th>Nome</th>
        </tr>
        <c:forEach var="mercado" items="${mercados}">
          <tr>
            <td>${mercado.id}</td>
            <td>${mercado.nome}</td>
            <td>
              <a href="/usuario/novo?id=${usuario.id}">
                <i class="material-icons small">swap_horiz</i>
              </a>
              <a href="/usuario/remover?id=${usuario.id}">
                <i class="material-icons small">delete</i>
              </a>
            </td>
          </tr>
        </c:forEach>
      </table>
    </div>
  </div>

</t:main>
