class AddProfileToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :bio, :string
    add_column :accounts, :website, :string
  end
end
