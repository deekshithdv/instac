class AddProfileToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :bio, :string , limit: 50
    add_column :accounts, :website, :string , limit: 20
  end
end
