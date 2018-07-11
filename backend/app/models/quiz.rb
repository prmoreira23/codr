class Quiz < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :questions
  has_many :answers
  has_one :score_board
  
end
