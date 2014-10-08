var Person = function() {
  this.canTalk = true
  this.greet = function() {
    if (this.canTalk) {
      console.log("Hi, I'm " + this.name);
    }
  }
}

var Employee = function(name, title) {
  this.name = name
  this.title = title
  this.greet = function() {
    if (this.canTalk) {
      console.log("Hi, I'm " + this.name + ", the " + this.title);
    }
  }
}

Employee.prototype = new Person()

var patrick = new Person()

var john = new Employee("John", "Manager")

patrick.greet.call(john)
