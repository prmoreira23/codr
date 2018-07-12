class ScoreBoardController {
  static renderScores(scores) {
    let html = `
    <table class="table table-striped" id="score_table" style="display: none;">
        <thead>
          <tr>
            <th>Username</th>
            <th>Total Points</th>
          </tr>
        </thead>
        <tbody>
          `;
        for(let score of scores){
          html += `
          <tr>
            <td>${score.username}</td>
            <td>${score.total_points}</td>
          </tr>
          `;
        };

    html += `

        </tbody>
    </table>
    `
     return $.parseHTML(html);
  }
}
