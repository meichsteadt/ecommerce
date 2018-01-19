class AddSlugCategories < ActiveRecord::Migration[5.0]
  def change
    change_table :categories do |t|
      t.string :slug
    end
  end
end
