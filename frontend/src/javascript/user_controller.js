function quizFunc(){
  var loading = $('#loadbar').hide();
  $(document)
  .ajaxStart(function () {
      loading.show();
  }).ajaxStop(function () {
    loading.hide();
  });

    $("label.btn").on('click',function () {
    	var choice = $(this).find('input:radio').val();
      $ans = currentQuiz.questions[currentQuestion].right_answer;
    	$('#loadbar').show();
    	$('#quiz').fadeOut();
      $( "#answer" ).html(checking(choice) +  `\t\t Answer: ${currentQuiz.questions[currentQuestion].choices[$ans]}`);
    	setTimeout(function(){
           currentQuestion++;
            //set new question
            if(currentQuestion < 5){
              UserController.displayQuiz(currentQuiz)
              $('#quiz').show();
              $('#loadbar').fadeOut();
            } else {
              let scoreBoard = {
                quiz_id: currentQuiz.id,
                user_id: currentUser.id,
                score: totalPoints
              };
              Adapter.createScoreBoard(scoreBoard)
              .then((score) => {
                UserController.displayScores()});
            }
    	}, 1000);
    });

    // We got this from API - Right Answer
    function checking(ck) {
      let answer = {
        question_id: currentQuiz.questions[currentQuestion].id,
        quiz_id: currentQuiz.id,
        user_answer: ck
      };

      Adapter.createAnswer(answer);

        if (ck != $ans){
            // return 'INCORRECT';
            new Audio('./src/audio/wat.mp3').play();
            return `&#10060 INCORRECT`;
      }  else{
            totalPoints += 20;
            new Audio('./src/audio/woohoo.mp3').play()
            return `&#9989 CORRECT`;
          }
    };
};


class UserController {

  static startGame() {
    let html = `
    <ul class="nav navbar-nav">
      <li><a href="#">${currentUser.message()}</a> </li>
      <li><a id="logout_button" href="#">Logout</a></li>
    </ul>
    `;
    $("#user_message").append($.parseHTML(html));
    $("#logout_button").on('click', function(event){
      App.init();
    });
    // alert(currentUser.message());
    Adapter.getQuiz(currentUser.id)
    .then(quiz => new Quiz(quiz))
    .then(quiz => currentQuiz = quiz)
    .then((quiz) => {
      $("#content").children().fadeOut(1000);
      currentQuestion = 0;
      totalPoints = 0;
      return currentQuiz;
    })
    .then(UserController.displayQuiz);
  }

  static displayQuiz(quiz) {
    var div = currentQuiz.renderQuiz(currentQuestion);
    $("#content").empty();
    $("#content").append(div);
    var $quizBox = $("#quiz_box");
    Prism.highlightElement($("code")[0]);
    quizFunc();
    $quizBox.fadeIn(1000);
  }

  static displayScores() {
    Adapter.getScores()
    .then(scores => {
      var div = ScoreBoardController.renderScores(scores);
      $("#content").empty();
      let header = $.parseHTML("<h1>Top 10 Scores</h1>");
      let button = $.parseHTML("<button>Play Again?</button>");
      $("#content").append(header, div, button);
      $("button").on('click', function(){
        UserController.startGame();
      });
      var $scoreTable = $("#score_table");
      $scoreTable.fadeIn(1500);
    });
  }
}
