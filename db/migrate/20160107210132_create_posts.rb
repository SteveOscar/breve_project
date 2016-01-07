class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size

      t.timestamps null: false
    end
  end
end
