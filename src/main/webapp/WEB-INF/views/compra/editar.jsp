<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<t:main title="Cadastro de usuários">
  <div class="row">
    <div class="s12">
      <h2 class="valign">Edição de compra</h2>
      <div class="row">
        <c:if test="${error}">
          <div class="valign">
            <div class="card red darken-2">
              <div class="card-content white-text">
                <span class="card-title">Existem erros no seu formulario</span>
                <p><form:errors path="compra.date"/></p>
                <p><form:errors path="compra.mercado"/></p>
              </div>
            </div>
          </div>
        </c:if>
        <form:form modelAttribute="compra" method="post" action="/compra/salva">
          <form:label path="date">Data:</form:label>
          <fmt:formatDate type="date" pattern="yyyy-MM-dd" var="theFormattedDate" value="${compra.date}"/>
          <form:input type="text" path="date" value="${compra.date}"/>
          <form:label path="mercado">Mercado:</form:label>
          <form:input path="mercado" value="${compra.mercado}"/><br />
          <form:hidden path="id" value="${compra.id}"/><br />
          <button class="btn right" type="submit">Salvar</button>
        </form:form>
      </div>
    </div>
  </div>


</t:main>