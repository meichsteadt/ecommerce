class EditUser < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.boolean :marketing_opt_in
    end
  end
end
