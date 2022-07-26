class CreateCategoriesPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_posts do |t|
      t.references :post 
      t.references :category
      
      t.timestamps
    end
  end
end
