class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :caption
      t.integer :account_id
      t.timestamps
    end
    add_index :posts, [:account_id, :created_at]
  end
end
