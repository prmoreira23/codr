class CreateQuestionsQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :questions_quizzes do |t|
      t.references :question, foreign_key: true
      t.references :quiz, foreign_key: true

      t.timestamps
    end
  end
end
