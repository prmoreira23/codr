class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :text
      t.text :choices, array: true, default: []
      t.integer :right_answer

      t.timestamps
    end
  end
end
