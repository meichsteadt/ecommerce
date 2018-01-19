class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.decimal :price
      t.string :name
      t.string :number
      t.string :description
      t.string :dimensions
      t.string :image
      t.integer :category_id
      t.string :slug

      t.timestamps
    end
  end
end
