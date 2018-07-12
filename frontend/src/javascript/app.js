let currentUser;
let currentQuiz;
let currentQuestion = 0;
let totalPoints = 0;

$(document).ready(main);

function main(){
  App.init();
  // $("h1").hide();
  // $content.append(welcome).fadeIn(2000);
}

class App {
    static init(){
      $("#content").empty();
      let welcomeH1 = $.parseHTML("<h1 id='welcome_message' class='mt-5' style='display: none;'>WELCOME</h1>");
      $("#content").append(welcomeH1);
      var $welcomeMessage = $("#welcome_message");
      $welcomeMessage.fadeIn(1000, function(){
      $welcomeMessage.fadeOut(1000, App.login);
    });


    }

    static login(){
      let html = `
      <div class="mt-5 form" style='display: none;'>
      <form id="login_form" action="#" method="post">
      <label>Username:
      <input type="text" id="form_username" name="username" value="">
      </label>
      <button type="submit" name="button">Login</button>
      </form>
      </div>
      `
      let form = $.parseHTML(html);
      $("#content").append(form);
      $(".form").fadeIn(1000, function(){
      $(".form").submit(function(event){
      // Login form submit
      let username = $("#form_username").val();
      Adapter.getUserByUsername(username)
      .then(user => new User(user))
      .then(userObj => currentUser = userObj)
      .then((user) => UserController.startGame());
      return false;
      });
      });
      $("#welcome_message").remove()
    }
}
