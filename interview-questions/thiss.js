// This

// 4 Tricky Conditions

// 1. Borrowing a method that uses this
// - 

// 2. Assign a method that uses this to a variable
// - Setting the this value with the bind method

// 3. When a function that uses this is passed as a callback function
// - Use Bind(), Apply(), or Call() to specifically set the value of this

// 4. This is used inside a closure - an inner function
// - Setting this to another value ie. that or self

var person = {
  firstName : 'Patrick',
  lastName  : 'Reynolds',
  showFullName : function() {
    console.log(this.firstName + ' ' + this.lastName)
  }
}

person.showFullName()

var anotherPerson = {
  firstName : 'Tony',
  lastName  : 'Leung'
}

person.showFullName.apply(anotherPerson)

// ====================================================
// Borrowing a method that uses this
var gameController = {
  scores :[20, 34, 55, 46, 77],
  avgScore: null,
  players :[
    {name:"Tommy", playerID:987, age:23},
    {name:"Pau", playerID:87, age:33}
  ]
}

var appController = {
  scores :[900, 845, 809, 950],
  avgScore: null,
  avg :function() {
    var sumOfScores = this.scores.reduce (function (prev, cur, index, array) {
      return prev + cur
    })

    this.avgScore = sumOfScores / this.scores.length
  }
}


// If we run the code below, the gameController.avgScore 
// property will be set to the average score from the 
// appController object 'scores' array

// Don't run this code, this is just for illustration; 
// we want the appController.avgScore to remain null
gameController.avgScore = appController.avg()



// Solution
// Note that we ware useing the apply() method, so the 
// 2nd argument has to be an array - the arguments to pass 
// to the appController.avg() method
appController.avg.apply(gameController, gameController.scores)

// the avgScore property was successfully set on the gameController object,
// even though we borrowed the avg() method from the appController object
console.log(gameController.avgScore) // 46.4

// appController.avgScore is still null; i was not updated, only
// gameController.avgScore was updated
console.log(appController.avgScore)



// ====================================================
// Assign a method that uses this to a variable
var data = [
  {name: 'Samantha', age:12},
  {name: 'Alexis', age:14}
];

var user = {
  data :[
    {name:'T. Woods', age:37},
    {name:'P. Mickelson', age:43}
  ],
  showData:function(event) {
    var randomNum = ((Math.random() * 2 | 0) + 1) -1;

    console.log(this.data[randomNum].name + ' ' + this.data[randomNum].age)
  }
}

// Assign the user.showData to a variable
var showUserData = user.showData

// When we execute the showUserData function, 
// the values printed to the console. are from 
// the global data array, not from the data array 
// in the user object
showUserData();

// Solution
// Vind the showData mehtod to the user object
var showUserData - user.showData.bind(user)

// Now we get thhe value from the user object, 
// because the this keyworkd is bound to the user object
showUserData()



// =======================================================
// when a function that uses this is passed as a callback function
var user = {
  data: [
    {name: 'T. Woods', age:37},
    {name: 'P. Mickelson', age:43}
  ],
  clickHandler:function(event) {
    var randomNum = ((Math.random() * 2 | 0) + 1) - 1
    console.log(this.data[randomNum].name + ' ' + 
      this.data[randomNum].age)
  }
}

// // property '0' of undefined
$('button').clieckuser.clickHandler)


// P. Mickelson 43
$('button').click(user.clickHandler.bind(user))



// =====================================================
// and this is used inside a closure - an inner function
var user = {
  tournament: 'The Masters',
  data: [
    {name: 'T. Woods', age:37},
    {name: '. Mickelson', age:43}
  ],
  clickHandler:function() {
    this.data.forEach(function(person) {
    
      console.log("What is This referring to? " + this)
      // [object Window]
      console.log(person.name + ' is playing at ' + this.tournamet)
      // T. Woods is playing at undefined
      // P. Mickelson is playing at undefined
    })
  }
}

user.clickHandler()
// What is this referring to? [object Window]


var user = {
  tournament: 'The Masteres',
  data : [
    {name: 'T. Woods', age:37},
    {name: 'P. Mickelson', age:43}
  ],
  clickHandler: function(event) {
    // Capturing the avlue of this
    var that = this;
    this.data.forEach(function(person) {
      console.log(person.name + ' is playing at ' + that.tournament)
    })
  }
}

user.clickHandler()
// T. Woods is playing at The Masters
//  P. Mickelson is playing at The Masters

