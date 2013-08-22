package bodybuilder

class Exercise {
  
  String description
  String name
  String muscle
  
  static constraints = {
    name blank: false
  }
}
