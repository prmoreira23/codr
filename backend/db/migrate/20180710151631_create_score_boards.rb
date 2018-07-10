class CreateScoreBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :score_boards do |t|
      t.integer :score
      t.references :user, foreign_key: true
      t.references :quiz, foreign_key: true

      t.timestamps
    end
  end
end
