<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<t:main title="Cadastro de usuários">
  <div class="row">
    <div class="s12">
      <h2 class="valign">Cadastro de produtos na Geladeira</h2>
      <div class="row">
        <c:if test="${error}">
          <div class="valign">
            <div class="card red darken-2">
              <div class="card-content white-text">
                <span class="card-title">Existem erros no seu formulario</span>
                <p><form:errors path="produto.nome"/></p>
                <p><form:errors path="produto.marca"/></p>
                <p><form:errors path="produto.validade"/></p>
                </p>
              </div>
            </div>
          </div>
        </c:if>
        <form:form modelAttribute="produto" action="/produto/salva" method="post">
          <div class="input-field col s12">
            <label for="nome">Nome</label>
            <input type="text" name="nome" id="nome" value="${produto.nome}"/>
          </div>
          <div class="input-field col s12">
            <label for="marca">Marca</label>
            <input type="text" name="marca" id="marca" value="${produto.marca}"/>
          </div>
          <div class="input-field col s12">
            <label for="valor">Valor</label>
            <input type="text" name="valor" id="valor" value="${produto.valor}"/>
          </div>
          <div class="input-field col s12">
            <form:label path="tipo">Tipo:</form:label>
            <form:select path="tipo" items="${tipos}">
            </form:select>
          </div>
          <fmt:formatDate type="date" pattern="dd/MM/yyyy" var="dateF" value="${produto.validade}"/>

          <div class="input-field col s12">
            <form:label path="validade">Validade:</form:label>
            <form:input type="text" path="validade" value="${dateF}"/>
          </div>

            <input type="hidden" name="id_compra" value="${compra.id}">
            <input type="hidden" name="id" value="${produto.id}">
          <form:hidden path="consumido" value="${produto.consumido}"></form:hidden>
          <div class="input-field col s12">
            <button class="btn">Enviar</button>
          </div>
        </form:form>
      </div>
    </div>
  </div>


</t:main>