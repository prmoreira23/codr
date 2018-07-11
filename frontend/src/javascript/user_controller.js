let html = `
<div id="quiz_box" class="modal-dialog" style="display: none;">
  <div class="modal-content">
     <div class="modal-header">
        <h3><span class="label label-warning" id="qid">2/5</span> What does the code below returns?</h3>
        <pre><code class="language-javascript">
          0.2 + 0.1 === 0.3
        </code></pre>
    </div>
    <div class="modal-body">
        <div class="col-xs-3 col-xs-offset-5">
           <div id="loadbar" style="display: none;">
              <div class="blockG" id="rotateG_01"></div>
              <div class="blockG" id="rotateG_02"></div>
              <div class="blockG" id="rotateG_03"></div>
              <div class="blockG" id="rotateG_04"></div>
              <div class="blockG" id="rotateG_05"></div>
              <div class="blockG" id="rotateG_06"></div>
              <div class="blockG" id="rotateG_07"></div>
              <div class="blockG" id="rotateG_08"></div>
          </div>
      </div>

      <div class="quiz" id="quiz" data-toggle="buttons">
       <label class="element-animation1 btn btn-lg btn-primary btn-block"><span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span> <input type="radio" name="q_answer" value="0">true</label>
       <label class="element-animation2 btn btn-lg btn-primary btn-block"><span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span> <input type="radio" name="q_answer" value="1">false</label>
       <label class="element-animation3 btn btn-lg btn-primary btn-block"><span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span> <input type="radio" name="q_answer" value="2">NaN</label>
       <label class="element-animation4 btn btn-lg btn-primary btn-block"><span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span> <input type="radio" name="q_answer" value="3">undefined</label>
   </div>
</div>
<div class="modal-footer text-muted">
<span id="answer"></span>
</div>
</div>
</div>

`;


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
    	$('#loadbar').show();
    	$('#quiz').fadeOut();
    	setTimeout(function(){
           $( "#answer" ).html(  $(this).checking(choice) );
            $('#quiz').show();
            $('#loadbar').fadeOut();
           /* something else */
    	}, 1500);
    });

    // We got this from API - Right Answer
    $ans = 1;

    $.fn.checking = function(ck) {
        if (ck != $ans)
            return 'INCORRECT';
        else
            return 'CORRECT';
    };
};

class UserController {

  static startGame() {
    alert(currentUser.message());
    Adapter.getQuiz(currentUser.id)
    .then(quiz => new Quiz(quiz))
    .then(quiz => currentQuiz = quiz)
    .then((quiz) => {
      $("#content").children().fadeOut(1000);
      return currentQuiz;
    })
    .then(UserController.displayQuiz)


  }

  static displayQuiz(quiz) {
    console.log("SHOWING QUIZ");
    var div = $.parseHTML(html);
    $("#content").empty();
    $("#content").append(div);
    var $quizBox = $("#quiz_box");
    quizFunc();
    $quizBox.fadeIn(1000);
  }
}
