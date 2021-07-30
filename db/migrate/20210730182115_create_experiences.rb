class CreateExperiences < ActiveRecord::Migration[6.1]
  def change
    create_table :experiences do |t|
      t.string :company_name
      t.date :start_date
      t.date :end_date
      t.text :designation
      t.references :user_account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
