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
      $("#user_message").empty();
      currentUser = undefined;
      currentQuiz = undefined;
      currentQuestion = 0;
      totalPoints = 0;
      $("#content").empty();
      let welcomeH1 = $.parseHTML("<h1 id='welcome_message' class='elegantshadow' style='display: none;'>WELCOME</h1>");
      $("#content").append(welcomeH1);
      var $welcomeMessage = $("#welcome_message");
      $welcomeMessage.fadeIn(1000, function(){
      $welcomeMessage.fadeOut(1000, App.login);
    });


    }

    static login(){
      let html = `
      <div class="login-page">
        <div class="form">
          <form class="login-form">
            <input id="form_username" type="text" placeholder="username"/>
            <button>login</button>
          </form>
        </div>
      </div>
      `
      let form = $.parseHTML(html);
      $("#content").append(form);
      $("#form_username").focus();
      $(".login-form").fadeIn(1000, function(){
      $(".login-form").submit(function(event){
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
