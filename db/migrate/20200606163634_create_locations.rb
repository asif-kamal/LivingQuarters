class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :location
      t.text :description
      t.integer :rating
      t.boolean :filled, default: false
      t.belongs_to :host, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
