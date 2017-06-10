<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<body>

<c:import url="cabecalho.jsp"/>

<!-- cria o DAO -->
<jsp:useBean id="dao" class="br.com.caelum.agenda.dao.ContatoDao"/>

<table border="1">
	<tr bgcolor ="F2E42A">
	<td>Id</td>
	<td>Nome</td>
	<td>Email</td>
	<td>Endereço</td>
	<td>Data de Nascimento</td>
	
	</tr>

<!--percorre contatos montando as linhas da tabela-->

<c:forEach var="contato" items="${dao.lista}" varStatus="id">

<tr bgcolor="#${id.count %2 == 0 ? '86F2A8' : 'ffffff'}">

	<td>${id.count}</td><td>${contato.nome}</td>
	
	<td>
	
	<c:if test="${not empty contato.email}">
		<a href="mailto:${contato.email}">${contato.email}</a>
	
	</c:if>
		
	<c:if test="${empty contato.email}">
		E-mail não informado
	
	</c:if>
		
	<td>${contato.endereco}</td>
	<td>${contato.dataNascimento.time}</td>
	
</tr>

</c:forEach>
</table>

<c:import url="rodape.jsp"/>

</body>
</html>