class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :location
      t.decimal :price = 0
      t.integer :capacity
      t.boolean :includes_food = false
      t.boolean :includes_drinks = false
      t.datetime :starts_at
      t.datetime :ends_at
      t.boolean :active = true

      t.timestamps
    end
  end
end
