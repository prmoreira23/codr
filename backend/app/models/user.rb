class User < ApplicationRecord
  has_many :score_boards
  has_many :quizzes

  def total_points
    self.score_boards.map {|score| score.score }.reduce(0) {|acc, ea| acc + ea}
  end
end
