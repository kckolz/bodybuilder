<%@ page import="bodybuilder.Exercise" %>



			<div class="control-group fieldcontain ${hasErrors(bean: exerciseInstance, field: 'name', 'error')} required">
				<label for="name" class="control-label"><g:message code="exercise.name.label" default="Name" /><span class="required-indicator">*</span></label>
				<div class="controls">
					<g:textField name="name" required="" value="${exerciseInstance?.name}"/>
					<span class="help-inline">${hasErrors(bean: exerciseInstance, field: 'name', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: exerciseInstance, field: 'description', 'error')} ">
				<label for="description" class="control-label"><g:message code="exercise.description.label" default="Description" /></label>
				<div class="controls">
					<g:textField name="description" value="${exerciseInstance?.description}"/>
					<span class="help-inline">${hasErrors(bean: exerciseInstance, field: 'description', 'error')}</span>
				</div>
			</div>

			<div class="control-group fieldcontain ${hasErrors(bean: exerciseInstance, field: 'muscle', 'error')} ">
				<label for="muscle" class="control-label"><g:message code="exercise.muscle.label" default="Muscle" /></label>
				<div class="controls">
					<g:textField name="muscle" value="${exerciseInstance?.muscle}"/>
					<span class="help-inline">${hasErrors(bean: exerciseInstance, field: 'muscle', 'error')}</span>
				</div>
			</div>

