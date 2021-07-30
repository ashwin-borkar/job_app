class AddStateToUserAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :user_accounts, :status, :string, null: false, default: "planned"
  end
end
