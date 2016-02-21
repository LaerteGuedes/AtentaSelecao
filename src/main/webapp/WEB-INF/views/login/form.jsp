<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:mainlogin title="Página de login">
  <div class="row">
    <div class="s12">
      <c:if test="${error}">
        <div class="valign">
          <div class="card red darken-2">
            <div class="card-content white-text">
              <span class="card-title">Senha ou login inválidos!</span>
              </p>
            </div>
          </div>
        </div>
      </c:if>
      <h2>Login</h2>
      <form action="/login/efetua" method="post">
        <div class="input-field col s12">
          <label for="email">Email</label>
          <input type="text" name="email" id="email" class="validate" value="${usuario.email}"/>
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
</t:mainlogin>
