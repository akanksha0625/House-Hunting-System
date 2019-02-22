class CreateHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.string :location
      t.integer :square_footage
      t.integer :year_built
      t.string :style
      t.integer :list_price
      t.integer :no_of_floors
      t.boolean :basement
      t.string :current_house_owner
      t.string :contact_info
      t.string :potential_buyers
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
