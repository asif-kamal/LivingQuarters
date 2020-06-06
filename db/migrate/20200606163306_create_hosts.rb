class CreateHosts < ActiveRecord::Migration[5.2]
  def change
    create_table :hosts do |t|
      t.string :name
      t.string :email
      t.string :origin
      t.boolean :admin
      t.string :uid
      t.string :provider
      t.string :password_digest
      t.timestamps null: false
    end
  end
end
