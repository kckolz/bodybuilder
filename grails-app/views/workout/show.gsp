
<%@ page import="bodybuilder.Workout" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'workout.label', default: 'Workout')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-workout" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="workout.exercises.label" default="Exercises" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${workoutInstance.exercises}" var="e">
						<li><g:link controller="exercise" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
