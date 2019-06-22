class CreatePostIts < ActiveRecord::Migration
  def change
    create_table :post_its do |t|
      t.string :content
      t.string :user_id
      t.timestamps null: false
    end
  end
end
