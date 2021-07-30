class CreateRefrencesContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :refrences_contacts do |t|
      t.string :ref_name
      t.string :ref_contact_number
      t.string :ref_relation
      t.references :user_account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
