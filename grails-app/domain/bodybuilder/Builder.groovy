package bodybuilder

class Builder {
  
  String name
  Collection workouts
  
  static hasMany = [workouts: Workout]
  
  static constraints = {
    name blank: false
  }
}
