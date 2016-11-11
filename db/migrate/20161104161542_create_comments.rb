class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :post, index: true, foreign_key: true
      t.text :body
      t.integer :user_id
      
      t.timestamps null: false
    end
    add_index :posts, :user_id
  end
end
