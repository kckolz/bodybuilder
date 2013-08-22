
<%@ page import="bodybuilder.Exercise" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'exercise.label', default: 'Exercise')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-exercise" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="exercise.name.label" default="Name" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: exerciseInstance, field: "name")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="exercise.description.label" default="Description" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: exerciseInstance, field: "description")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="exercise.muscle.label" default="Muscle" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: exerciseInstance, field: "muscle")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
