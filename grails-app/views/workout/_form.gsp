<%@ page import="bodybuilder.Workout" %>



			<div class="control-group fieldcontain ${hasErrors(bean: workoutInstance, field: 'exercises', 'error')} ">
				<label for="exercises" class="control-label"><g:message code="workout.exercises.label" default="Exercises" /></label>
				<div class="controls">
					<g:select name="exercises" from="${bodybuilder.Exercise.list()}" multiple="multiple" optionKey="id" size="5" value="${workoutInstance?.exercises*.id}" class="many-to-many"/>
					<span class="help-inline">${hasErrors(bean: workoutInstance, field: 'exercises', 'error')}</span>
				</div>
			</div>

