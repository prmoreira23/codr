const BASE_URL_USERS = "http://localhost:3000/api/v1/users/";
const BASE_URL_QUIZZES = "http://localhost:3000/api/v1/quizzes";
const BASE_URL_SCORES = "http://localhost:3000/api/v1/scores";
const BASE_URL_ANSWERS = "http://localhost:3000/api/v1/answers";
const BASE_URL_SCOREBOARD = "http://localhost:3000/api/v1/scoreboards";



class Adapter {
  static getUserByUsername(username){
    let url = `${BASE_URL_USERS}${username}`;
    return fetch(url)
    .then(res => res.json());
  }

  static getQuiz(userId) {
    let url = `${BASE_URL_QUIZZES}`;
    let body = {user_id: userId};
    let options = {
      method: "POST",
      headers: {
        "Content-Type" : "application/json"
      },
      body: JSON.stringify(body)
    }
    return fetch(url, options)
    .then(response => response.json());
  }

  static getScores(){
    let url = `${BASE_URL_SCORES}`;
    return fetch(url)
    .then(res => res.json())
    .then(scores => {
      return scores.sort(function(a, b){
	       return b.total_points - a.total_points;
      }).splice(0, 10);
    });
  }

  static createAnswer(answer) {
    let url = `${BASE_URL_ANSWERS}`;
    let options = {
      method: "POST",
      headers: {
        "Content-Type" : "application/json"
      },
      body: JSON.stringify(answer)
    };
    return fetch(url, options).then(response => response.json())

  }

  static createScoreBoard(scoreBoard) {
    let url = `${BASE_URL_SCOREBOARD}`;
    let options = {
      method: "POST",
      headers: {
        "Content-Type" : "application/json"
      },
      body: JSON.stringify(scoreBoard)
    };
    return fetch(url, options).then(response => response.json())

  }
}
