class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :section
      t.text :question
      t.text :instruction
      t.string :question_type

      t.timestamps
    end
  end
end
