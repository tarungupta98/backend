class AlterArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :author, :string
    add_column :articles, :category, :string
    
  end
end
