# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Question.destroy_all

Question.create({text: "0.2 + 0.1 === 0.3", choices: ["true", "false", "NaN", "undefined"], right_answer: 1});
Question.create({text: "0.4 + 0.3 === 0.7", choices: ["true", "false", "null", "undefined"], right_answer: 0});
Question.create({text: "0.6 + 0.3 === 0.9", choices: ["true", "false", "NaN", "null"], right_answer: 1});

Question.create({text: "[] + []", choices: ["null", "TypeError", "\"\"", "[]"], right_answer: 2});
Question.create({text: "[] + {}", choices: ["null", "TypeError", "[object Object]", "\"\""], right_answer: 3});
Question.create({text: "{} + []", choices: ["\"\"", "NaN", "0", "[object Object]"], right_answer: 2});
Question.create({text: "{} + {}", choices: ["NaN", "\"\"", "TypeError", "[object Object]"], right_answer: 0});

Question.create({text: "1 + 2 + \"3\" + 4 + 5", choices: ["NaN", "TypeError", "15", "3345"], right_answer: 3});


question = <<EOM
(function(x, f = () => x) {
  var x;
  var y = x;
  x = 2;
  return [x, y, f()];
})(1);
EOM
Question.create({text: question, choices: ["[2, 1, 1]", "[2, undefined, 1]", "[2, 1, 2]", "[2, undefined, 2]"], right_answer: 0});

question = <<EOM
(function() {
  return [
    (() => this.x).bind({ x: 'inner' })(),
    (() => this.x)()
  ]
}).call({ x: 'outer' });
EOM
Question.create({text: question, choices: ["['inner', 'outer']", "['outer', 'outer']", "[undefined, undefined]", "Error"], right_answer: 1});


question = "let x, { x: y = 1 } = { x }; y;"
Question.create({text: question, choices: ["undefined", "1", "{ x: 1 }", "Error"], right_answer: 1});

question = <<EOM
(function() {
  let f = this ? class g { } : class h { };
  return [
    typeof f,
    typeof h
  ];
})();
EOM
Question.create({text: question, choices: ["Error", "['function', 'function']", "['undefined', 'undefined']", "['function', 'undefined']"], right_answer: 3});

question = "(typeof (new (class { class () {} })))"
Question.create({text: question, choices: ["function", "object", "undefined", "Error"], right_answer: 1});

question = "typeof (new (class F extends (String, Array) { })).substring"
Question.create({text: question, choices: ["function", "object", "undefined", "Error"], right_answer: 2});

question = "typeof (new (class F extends (Array, String) { })).substring"
Question.create({text: question, choices: ["function", "object", "undefined", "Error"], right_answer: 0});

question = "[...[...'...']].length"
Question.create({text: question, choices: ["6", "1", "Error", "3"], right_answer: 3});

question = "typeof `${{Object}}`.prototype"
Question.create({text: question, choices: ["'function'", "'undefined'", "Error", "'object'"], right_answer: 1});

question = "((...x, xs)=>x)(1,2,3)"
Question.create({text: question, choices: ["1", "3", "[1, 2, 3]", "Error"], right_answer: 3});

question = "((xs, ...x)=>x)(1,2,3)"
Question.create({text: question, choices: ["[1,2,3]", "[1,2]", "[2, 3]", "Error"], right_answer: 2});

question = <<EOM
for(i = 0, array=[]; i < 3; i++){
	array.push(i)
}
EOM
Question.create({text: question, choices: ["[0, 1, 2]", "null", "3", "undefined"], right_answer: 2});

question = "!!(true && false)"
Question.create({text: question, choices: ["true", "[ ]", "[false]", "false"], right_answer: 3});

question = <<EOM
function average(a, b) {
  return a + b / 2;
}

console.log(average(2, 1));
EOM
Question.create({text: question, choices: ["NaN", "null", "1.5", "2.5"], right_answer: 3});

question = <<EOM
let obj = {name: `meow meow`, age: 22, desc: `singing`};
let property= 'desc';
function remove(obj, property) {
  delete obj.property;
  return obj;
};
remove(obj, property);
EOM
Question.create({text: question, choices: ["Undefined", "{name: 'meow meow', age: 22, desc: 'singing'}", "{name: 'meow meow', age: 22}", "Singing"], right_answer: 1});

question = <<EOM
let obj = {name: `meow meow`, age: 22, desc: `singing`};
let property= 'desc';
function remove(obj, property) {
  delete obj[property];
  return obj;
};
remove(obj, property)
EOM
Question.create({text: question, choices: ["undefined", "{name: 'meow meow', age: 22, desc: 'singing'}", "{name: 'meow meow', age: 22}", "Singing"], right_answer: 2});

question = <<EOM
let obj = {name: `meow meow`, age: 22, desc: `singing`};
let property= 'desc';
function remove(obj, property) {
  delete obj[property];
  return property;
};
remove(obj, property)
EOM
Question.create({text: question, choices: ["undefined", "'desc'", "{name: 'meow meow', age: 22}", "'Singing'"], right_answer: 1});

question = <<EOM
var z;
if (function f() {}) {
  z = typeof f;
}
console.log(z);
EOM
Question.create({text: question, choices: ["undefined", "function", "Error", "Pudding"], right_answer: 0});

question = <<EOM
function f() {}
typeof f;
EOM
Question.create({text: question, choices: ["undefined", "function", "Error", "Object"], right_answer: 1});

question = <<EOM
function mul (x) {
  return function (y) {
    return function (z) {
      return x * y * z;
    };
  };
}
console.log(mul(2)(3)(4));
EOM
Question.create({text: question, choices: ["10", "24", "Error", "[2,3,4]"], right_answer: 1});

question = <<EOM
var arrayList = ['a', 'b', 'c', 'd', 'e', 'f'];
var anotherArrayList = arrayList;
arrayList = [];
console.log(anotherArrayList);
EOM
Question.create({text: question, choices: ["['a', 'b', 'c', 'd', 'e', 'f']", "[ ]", "Undefined", "'arrayList'"], right_answer: 0});

question = <<EOM
var arrayList = ['a', 'b', 'c', 'd', 'e', 'f'];
var anotherArrayList = arrayList;
arrayList.length = 0;
console.log(anotherArrayList);
EOM
Question.create({text: question, choices: ["['a', 'b', 'c', 'd', 'e', 'f']", "[ ]", "Undefined", "'arrayList'"], right_answer: 1});

question = <<EOM
var arrayList = ['a', 'b', 'c', 'd', 'e', 'f'];
var anotherArrayList = arrayList;
arrayList.splice(0, arrayList.length);
console.log(anotherArrayList);
EOM
Question.create({text: question, choices: ["['a', 'b', 'c', 'd', 'e', 'f']", "[ ]", "['a', 'b', 'c', 'd', 'e']", "['f']"], right_answer: 1});

question = <<EOM
var arrayList = ['a', 'b', 'c', 'd', 'e', 'f'];
while(arrayList.length) {
  arrayList.pop();
}
console.log(arrayList);
EOM
Question.create({text: question, choices: ["['a', 'b', 'c', 'd', 'e', 'f']", "[ ]", "['a', 'b', 'c', 'd', 'e']", "['a']"], right_answer: 1});

question = <<EOM
var trees = ["xyz", "xxxx", "test", "ryan", "apple"];
delete trees[3];
console.log(trees.length);
EOM
Question.create({text: question, choices: ["2", "4", "5", "3"], right_answer: 2});

question = <<EOM
var trees = ["xyz", "xxxx", "test", "ryan", "apple"];
delete trees[3];
console.log(trees);
EOM
Question.create({text: question, choices: ["['xyz', 'xxxx', 'test', 'ryan', 'apple']", "['xyz', 'xxxx', 'test', 'apple']", "['xyz', 'xxxx', 'test', empty, 'apple']", "['ryan', 'apple']"], right_answer: 2});

question = <<EOM
var z = 1, y = z = typeof y;
console.log(y);
EOM
Question.create({text: question, choices: ["Undefined", "z", "number", "var"], right_answer: 0});

question = <<EOM
var foo = function bar() { return 12; };
typeof bar();
EOM
Question.create({text: question, choices: ["Undefined", "function", "number", "Reference Error"], right_answer: 3});

question = <<EOM
var bar = function() { return 12; };
typeof bar();
EOM
Question.create({text: question, choices: ["Undefined", "function", "number", "Reference Error"], right_answer: 2});

question = <<EOM
function User(name) {
  this.name = name;
}

var person = new User("Meat")["location"] = "USA";
console.log(person);
EOM
Question.create({text: question, choices: ["Meat", "USA", "{name: 'Meat', location: 'USA'}", "Undefined"], right_answer: 1});

question = <<EOM
(function(){
   return typeof arguments;
 })();
EOM
Question.create({text: question, choices: ["Object", "Array", "arguments", "Undefined"], right_answer: 0});

question = <<EOM
(function(x){
   delete x;
   return x;
 })(1);
EOM
Question.create({text: question, choices: ["1", "null", "Error", "Undefined"], right_answer: 0});

question = <<EOM
(function f(f){
    return typeof f();
  })(function(){ return 1; });
EOM
Question.create({text: question, choices: ["1", "number", "function", "Undefined"], right_answer: 1});

question = <<EOM
var foo = {
   bar: function() { return this.baz; },
   baz: 1
 };
 (function(){
   return typeof arguments[0]();
 })(foo.bar);
EOM
Question.create({text: question, choices: ["undefined", "object" ,"number", "function"], right_answer: 0});

question = <<EOM
var f = (function f(){ return "1"; }, function g(){ return 2; })();
typeof f;
EOM
Question.create({text: question, choices: ["string", "number", "function", "undefined"], right_answer: 1});

question = <<EOM
var x = [typeof x, typeof y][1];
typeof typeof x;
EOM
Question.create({text: question, choices: ["string", "number", "object", "undefined"], right_answer: 0});

question = <<EOM
(function f(){
   function f(){ return 1; }
   return f();
   function f(){ return 2; }
 })();
EOM
Question.create({text: question, choices: ["1", "2", "Error", "undefined"], right_answer: 1});

question = <<EOM
function f(){ return f; }
  new f() instanceof f;
EOM
Question.create({text: question, choices: ["undefined", "true", "Error", "false"], right_answer: 3});

question = <<EOM
with (function(x, undefined){}) length;
EOM
Question.create({text: question, choices: [ "undefined", "2", "Error", "NaN"], right_answer: 1});

question = <<EOM
function getFunc() {
    var a = 7;
    return function(b) {
        alert(a+b);
    }
}
var f = getFunc();
f(5);
EOM
Question.create({text: question, choices: [ "undefined", "5", "7", "12"], right_answer: 3});
