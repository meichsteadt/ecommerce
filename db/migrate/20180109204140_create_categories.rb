class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :image
      t.string :parent_category

      t.timestamps
    end
  end
end
