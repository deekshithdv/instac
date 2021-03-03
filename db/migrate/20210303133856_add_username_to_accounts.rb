class AddUsernameToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :username, :string , limit: 20
  end
end
