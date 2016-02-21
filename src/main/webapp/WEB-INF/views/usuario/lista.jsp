<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:main title="Lista de Usuários">
  <div class="row">
    <div class="s12">
      <ul id='dropdown1' class='dropdown-content'>
        <li><a href="#!">one</a></li>
        <li><a href="#!">two</a></li>
        <li class="divider"></li>
        <li><a href="#!">three</a></li>
      </ul>
      <h2>Listagem de Usuarios</h2>
      <table class="bordered">
        <tr>
          <th>Nome</th>
          <th>Email</th>
          <th>Perfil</th>
          <th>Açoes</th>
        </tr>
        <c:forEach var="usuario" items="${usuarios}">
          <tr>
            <td>${usuario.nome}</td>
            <td>${usuario.email}</td>
            <td>${usuario.perfil}</td>
            <td>
              <a href="/usuario/cadastro?id=${usuario.id}">
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
