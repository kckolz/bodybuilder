package bodybuilder

class Workout {
  Date day
  Collection exercises
  static hasMany = [exercises: Exercise]
  static constraints = {
    day nullable: true
  }
}
