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
      <c:if test="${listaconsumidos}">
        <h3>Listagem de produtos consumidos</h3>
      </c:if>
      <c:if test="${!listaconsumidos}">
        <h3>Listagem de produtos na geladeira</h3>
      </c:if>
      <c:if test="${message != null}">
        <div class="valign">
          <div class="card blue light-2">
            <div class="card-content white-text">
              <span class="card-title">${message}</span>
              </p>
            </div>
          </div>
        </div>
      </c:if>

      <c:if test="${produtos.size() > 0}">
        <a class="btn" href="/produto/listaxml/${listaconsumidos}" >Ver em formato XML</a>
        <table class="bordered">
          <tr>
            <th>Nome</th>
            <th>Valor</th>
            <th>Tipo</th>
            <th>Validade</th>
            <th>Consumido</th>
            <th>Data da compra</th>
            <th>Excluir</th>
          </tr>
          <c:forEach var="produto" items="${produtos}">
            <tr>
              <td>${produto.nome}</td>
              <td>${produto.valor}</td>
              <td>${produto.tipo}</td>
              <td><fmt:formatDate type="date" pattern="dd/MM/yyyy" value="${produto.validade}" /></td>
              <td>
                <c:if test="${!produto.consumido}">
                  <p>Não</p>
                  <a href="/produto/consumir/${produto.id}/${!produto.consumido}">Marcar como consumido</a>
                </c:if>
                <c:if test="${produto.consumido}">
                  <p>Sim</p>
                  <a href="/produto/consumir/${produto.id}/${!produto.consumido}">Desmarcar como consumido</a>
                </c:if>
              </td>
              <td>
                <fmt:formatDate type="date" pattern="dd/MM/yyyy" value="${produto.compra.date}" /></td>
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