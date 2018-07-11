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
