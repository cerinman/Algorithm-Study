// function sum(x) {
//   if (arguments.length == 2) {
//     return arguments[0] + arguments[1];
//   } else {
//     return function(y) { return x + y };
//   }
// }

// console.log(sum(2, 3));
// console.log(sum(2)(3));

var test = function() {
  return arguments
}

var args1 = test.apply(this, ['Patrick') // => arguments = ['Patrick', 'John']
var args2 = test.call(this, ['John']) // => arguments = {['Patrick', 'John'], adsf, asdf, asd}

console.log(args1)
console.log(args2)