package bodybuilder

import org.springframework.dao.DataIntegrityViolationException

/**
 * WorkoutController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class WorkoutController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [workoutInstanceList: Workout.list(params), workoutInstanceTotal: Workout.count()]
    }

    def create() {
        [workoutInstance: new Workout(params)]
    }

    def save() {
        def workoutInstance = new Workout(params)
        if (!workoutInstance.save(flush: true)) {
            render(view: "create", model: [workoutInstance: workoutInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'workout.label', default: 'Workout'), workoutInstance.id])
        redirect(action: "show", id: workoutInstance.id)
    }

    def show() {
        def workoutInstance = Workout.get(params.id)
        if (!workoutInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'workout.label', default: 'Workout'), params.id])
            redirect(action: "list")
            return
        }

        [workoutInstance: workoutInstance]
    }

    def edit() {
        def workoutInstance = Workout.get(params.id)
        if (!workoutInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'workout.label', default: 'Workout'), params.id])
            redirect(action: "list")
            return
        }

        [workoutInstance: workoutInstance]
    }

    def update() {
        def workoutInstance = Workout.get(params.id)
        if (!workoutInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'workout.label', default: 'Workout'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (workoutInstance.version > version) {
                workoutInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'workout.label', default: 'Workout')] as Object[],
                          "Another user has updated this Workout while you were editing")
                render(view: "edit", model: [workoutInstance: workoutInstance])
                return
            }
        }

        workoutInstance.properties = params

        if (!workoutInstance.save(flush: true)) {
            render(view: "edit", model: [workoutInstance: workoutInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'workout.label', default: 'Workout'), workoutInstance.id])
        redirect(action: "show", id: workoutInstance.id)
    }

    def delete() {
        def workoutInstance = Workout.get(params.id)
        if (!workoutInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'workout.label', default: 'Workout'), params.id])
            redirect(action: "list")
            return
        }

        try {
            workoutInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'workout.label', default: 'Workout'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'workout.label', default: 'Workout'), params.id])
            redirect(action: "show", id: params.id)
        }
    }
}
