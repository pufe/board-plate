class CreateInitialTables < ActiveRecord::Migration[5.2]
  def change
    create_table :logins do |t|
      t.string :name
      t.string :encrypted_password
      t.timestamps
    end
    create_table :lobbies do |t|
      t.string :name
      t.string :status, default: "open", null: false
      t.string :encrypted_password, null: true
      t.string :owner, null: false
      t.string :players, array: true, default: []
      t.string :guests, array: true, default: []
      t.string :messages, array: true, default: []
    end
  end
end
