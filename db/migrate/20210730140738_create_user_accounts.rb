class CreateUserAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :user_accounts do |t|
      t.string :first_name
      t.string :last_name
      t.string :designation
      t.text :address1
      t.text :address2
      t.string :phone_number
      t.string :city
      t.boolean :gender
      t.string :state
      t.boolean :relation_status
      t.date :date_of_birth
      t.string :zipcode
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

