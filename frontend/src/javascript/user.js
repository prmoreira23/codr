class User {
  constructor(user){
    this.id = user.id;
    this.username = user.username;
    this.totalPoints = user.total_points;
  }

  message(){
    return `Welcome, ${this.username}!`;
  }
}
