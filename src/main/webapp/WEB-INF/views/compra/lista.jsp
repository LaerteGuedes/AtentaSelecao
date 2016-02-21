<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<t:main title="Lista de Compras">
    <div class="row">
        <div class="s12">
            <h3>Listagem geral de compras</h3>
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
            <a href="/compra/cadastro" class="btn">Adicionar</a>
            <c:choose>
                <c:when test="${fn:length(compras) gt 0}">
                    <table class="highlight">
                        <tr class="grey">
                            <th>Id</th>
                            <th>Data da compra</th>
                            <th>Mercado</th>
                            <th>Adicionar Produtos</th>
                            <th>Editar</th>
                            <th>Excluir</th>
                            <th></th>
                            <th></th>
                        </tr>
                        <c:forEach var="compra" items="${compras}">
                            <tr class="grey lighten-2">
                                <td>${compra.id}</td>
                                <td><fmt:formatDate type="date" pattern="dd/MM/yyyy" value="${compra.date}" /></td>
                                <td>${compra.mercado}</td>
                                <td>
                                    <a href="/produto/novo/${compra.id}" class="btn">Adicionar</a>
                                </td>
                                <td>
                                    <a href="/compra/editar/${compra.id}">Editar
                                    </a>
                                </td>
                                <td>
                                    <a href="/compra/excluir/${compra.id}">
                                        Excluir
                                    </a>
                                </td>
                                <td></td>
                                <td></td>
                            </tr>
                            <c:if test="${compra.produtos.size() > 0}">
                                <tr class="orange lighten-3">
                                    <th>Nome</th>
                                    <th>Valor</th>
                                    <th>Tipo</th>
                                    <th>Validade</th>
                                    <th>Valor</th>
                                    <th>Consumido</th>
                                    <th>Editar</th>
                                    <th>Excluir</th>
                                </tr>
                                <c:forEach var="produto" items="${compra.produtos}">
                                    <tr class="orange lighten-4">
                                        <td>${produto.nome}</td>
                                        <td>${produto.valor}</td>
                                        <td>${produto.tipo}</td>
                                        <td><fmt:formatDate type="date" pattern="dd/MM/yyyy" value="${produto.validade}" /></td>
                                        <td>${produto.valor}</td>
                                        <td>
                                            <c:if test="${produto.consumido}">
                                                <p>Sim</p>
                                                <a href="/produto/consumir/${produto.id}/${!produto.consumido}" class="btn red lighten-2">Desmarcar</a>
                                            </c:if>
                                            <c:if test="${!produto.consumido}">
                                                    <p>Não</p>
                                                    <a href="/produto/consumir/${produto.id}/${!produto.consumido}" class="btn green lighten-2">Marcar</a>
                                            </c:if>
                                        </td>
                                        <td>
                                            <a href="/produto/novo/${compra.id}/${produto.id}">Editar</a>
                                        </td>
                                        <td>
                                            <a href="/produto/excluir/${produto.id}">Excluir</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>

                        </c:forEach>
                    </table>
                </c:when>
                <c:when test="${fn:length(companies) == 0}">
                    <p>Nao ha compras cadastradas no momento</p>
                </c:when>
            </c:choose>
        </div>
    </div>

</t:main>

