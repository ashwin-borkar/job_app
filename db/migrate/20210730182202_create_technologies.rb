class CreateTechnologies < ActiveRecord::Migration[6.1]
  def change
    create_table :technologies do |t|
      t.string :name
      t.boolean :beginer
      t.boolean :middeator
      t.boolean :experter
      t.references :user_account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
