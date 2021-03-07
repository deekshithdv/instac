class AddProfileToAccounts < ActiveRecord::Migration[6.1]
  def change
    remove_column :accounts, :bio
  end
end
