class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :question, foreign_key: true
      t.references :quiz, foreign_key: true
      t.integer :user_answer

      t.timestamps
    end
  end
end
