class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.references :question
      t.text :answer
      t.integer :score

      t.timestamps
    end
  end
end
