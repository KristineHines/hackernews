class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.text :url
      t.references :user
      t.timestamps
    end
  end
end
