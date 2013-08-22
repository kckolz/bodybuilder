
<%@ page import="bodybuilder.Exercise" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'exercise.label', default: 'Exercise')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-exercise" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="name" title="${message(code: 'exercise.name.label', default: 'Name')}" />
			
				<g:sortableColumn property="description" title="${message(code: 'exercise.description.label', default: 'Description')}" />
			
				<g:sortableColumn property="muscle" title="${message(code: 'exercise.muscle.label', default: 'Muscle')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${exerciseInstanceList}" status="i" var="exerciseInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${exerciseInstance.id}">${fieldValue(bean: exerciseInstance, field: "name")}</g:link></td>
			
				<td>${fieldValue(bean: exerciseInstance, field: "description")}</td>
			
				<td>${fieldValue(bean: exerciseInstance, field: "muscle")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${exerciseInstanceTotal}" />
	</div>
</section>

</body>

</html>
