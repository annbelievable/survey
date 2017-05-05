class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :phone
      t.string :company
      t.string :email

      t.timestamps
    end
  end
end
