class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.date :date
      t.boolean :published, default: false
      t.integer :view, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
