class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.belongs_to :user

      t.string :title
      t.text :content
      t.date :date
      t.integer :likesNo
      t.integer :commentNo
      t.string :article_imageURL

      t.timestamps
    end

  end
end
