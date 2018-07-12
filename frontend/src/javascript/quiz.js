class Quiz {

  constructor(quiz) {
    this.id = quiz.id
    this.userId = quiz.user_id
    this.questions = quiz.questions
  }

  renderQuiz(i) {
    let question = currentQuiz.questions[i];
    let html = `
    <div id="quiz_box" class="modal-dialog" style="display: none;">
      <div class="modal-content">
         <div class="modal-header">
            <h3><span class="label label-warning" id="qid">${i+1}/5</span> What does the code below return?</h3>
            <pre><code class="language-javascript">
              ${question.text}
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

          <div class="quiz" id="quiz" data-toggle="buttons">`;
          for(var choice of question.choices){
            let i = question.choices.indexOf(choice);
            html += `<label class="element-animation${i+1} btn btn-lg btn-primary btn-block"><span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span> <input type="radio" name="q_answer" value="${i}">${choice}</label>`;
          }

          html += `
       </div>
      </div>
      <div class="modal-footer text-muted">
      <span id="answer"></span>
      </div>
      </div>
      </div>
      `;
      return $.parseHTML(html);
  }
}
