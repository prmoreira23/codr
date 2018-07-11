const BASE_URL_USERS = "http://localhost:3000/api/v1/users/";
const BASE_URL_QUIZZES = "http://localhost:3000/api/v1/quizzes";


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
}
