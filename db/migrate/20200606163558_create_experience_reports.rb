class CreateExperienceReports < ActiveRecord::Migration[5.2]
  def change
    create_table :experience_reports do |t|
      t.string :title
      t.text :content
      t.belongs_to :host
      t.belongs_to :attraction

      t.timestamps null: false
    end
  end
end
