class CreateInitialTables < ActiveRecord::Migration[5.2]
  def change
    create_table :logins do |t|
      t.string :name
      t.string :encrypted_password
      t.timestamps
    end
  end
end