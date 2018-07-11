class QuizSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :questions
  has_many :questions
end
