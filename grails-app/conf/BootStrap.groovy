import bodybuilder.Role
import bodybuilder.User
import bodybuilder.UserRole

class BootStrap {

    def init = { servletContext ->
        
      def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
      def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

      def adminUser = new User(username: 'admin', enabled: true, password: 'password')
      adminUser.save(flush: true)

      UserRole.create adminUser, adminRole, true
      
      def normalUser = new User(username: 'user', enabled: true, password: 'password')
      normalUser.save(flush: true)

      UserRole.create normalUser, userRole, true

      assert User.count() == 2
      assert Role.count() == 2
      assert UserRole.count() == 2
    }
    def destroy = {
    }
}
