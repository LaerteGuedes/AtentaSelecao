<%--
  Created by IntelliJ IDEA.
  User: laerteguedes
  Date: 18/02/16
  Time: 20:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:main title="Lista de produtos">
  <div class="row">
    <div class="s12">
      <h3>Listagem de produtos na geladeira</h3>
      <c:if test="${produtos.size() > 0}">
        <table class="bordered">
          <tr>
            <th>Nome</th>
            <th>Valor</th>
            <th>Tipo</th>
            <th>Validade</th>
            <th>Consumido</th>
            <th>Editar</th>
            <th>Excluir</th>
          </tr>
          <c:forEach var="produto" items="${produtos}">
            <tr>
              <td>${produto.nome}</td>
              <td>${produto.valor}</td>
              <td>${produto.tipo}</td>
              <td>${produto.validade}</td>
              <td>
                <c:if test="${!produto.consumido}">
                  <p>Não</p>
                  <a href="/produto/consumir/${produto.id}/${!produto.consumido}">Marcar como consumido</a>
                </c:if>
              </td>
              <td>
                <a href="/produto/novo/${produto.compra.id}/${produto.id}"> Editar</a>
              </td>
              <td>
                <a href="/produto/excluir/${produto.id}"> Excluir</a>
              </td>
            </tr>
          </c:forEach>
        </table>
      </c:if>
      <c:if test="${produtos.size() == 0}">
        <p>Nenhum produto na geladeira no momento</p>
      </c:if>
    </div>
  </div>
</t:main>