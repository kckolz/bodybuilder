package bodybuilder

import grails.plugins.springsecurity.Secured

/**
 * WorkoutController
 * A controller class handles incoming web requests and performs actions such as redirects, rendering views and so on.
 */
class WorkoutController {

	static scaffold = true
        
    @Secured(['ROLE_USER','ROLE_ADMIN'])
	def index = {
      render 'Secure access only'
    }
}
