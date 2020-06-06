class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.string :name
      t.text :description
      t.belongs_to :location, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
