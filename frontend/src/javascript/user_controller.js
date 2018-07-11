class UserController {

  static startGame() {
    alert(currentUser.message());
    Adapter.getQuiz(currentUser.id)
    .then(quiz => new Quiz(quiz))
    .then(quiz => currentQuiz = quiz)
    .then((quiz) => {
      $("#content").fadeOut(1000, function(){
        $("#content").empty();
      });
      return currentQuiz;
    })
    .then(UserController.displayQuiz)


  }

  static displayQuiz(quiz) {
    console.log("SHOWING QUIZ");
  }
}
