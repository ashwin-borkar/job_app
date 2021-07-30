class CreateEducations < ActiveRecord::Migration[6.1]
  def change
    create_table :educations do |t|
      t.string :cource_name
      t.string :university_name
      t.string :passing_year
      t.integer :percentage
      t.references :user_account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
