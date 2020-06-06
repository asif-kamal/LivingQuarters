class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.string :name
      t.integer :rating
      t.boolean :filled, default: false
      t.belongs_to :host, index: true, foreign_key: true
      t.belongs_to :attraction, index: true, foreign_key: true
      t.belongs_to :location, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
