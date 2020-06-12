class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.text :description


      t.timestamps null: false
    end
  end
end
