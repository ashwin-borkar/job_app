class CreatePreferences < ActiveRecord::Migration[6.1]
  def change
    create_table :preferences do |t|
      t.string :location_type
      t.string :notice_period
      t.string :expected_ctc
      t.string :current_ctc
      t.string :department_type
      t.references :user_account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
