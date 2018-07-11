class Question < ApplicationRecord
  has_and_belongs_to_many :quizzes

  def self.get_random_questions(n)
    Question.order("RANDOM()").limit(n)
  end

end
