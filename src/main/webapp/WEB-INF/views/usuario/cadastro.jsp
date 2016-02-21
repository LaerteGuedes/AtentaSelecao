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
                <p><form:errors path="usuario.nome"/></p>
                <p><form:errors path="usuario.email"/></p>
                <p><form:errors path="usuario.senha"/></p>
                </p>
              </div>
            </div>
          </div>
        </c:if>
        <form action="#" method="post">
          <div class="input-field col s12">
            <label for="nome">Nome</label>
            <input type="text" name="nome" id="nome" class="validate" value="${produto.nome}"/>
          </div>
          <div class="input-field col s12">
            <label for="email">Marca</label>
            <input type="text" name="marca" id="marca" class="validate" value="${produto.marca}"/>
          </div>
          <div class="input-field col s12">
            <label for="email">Valor</label>
            <input type="text" name="valor" id="valor" class="validate" value="${produto.valor}"/>
          </div>
          <div class="input-field col s12">
            <label for="email">Marca</label>
            <input type="text" name="email" id="email" class="validate" value="${produto.marca}"/>
          </div>
          <div class="input-field col s12">
            <label for="senha">Senha</label>
            <input type="password" name="senha" id="senha" class="validate" value="${usuario.senha}"/>
          </div>
          <div class="input-field col s12">
            <button class="btn">Enviar</button>
          </div>
        </form>
      </div>
    </div>
  </div>


</t:main>