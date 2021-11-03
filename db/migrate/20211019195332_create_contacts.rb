class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :phone, limit: 50
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :contacts, :created_by
    add_foreign_key :contacts, :users, column: :created_by, primary_key: :id

    add_index :contacts, :updated_by
    add_foreign_key :contacts, :users, column: :updated_by, primary_key: :id
  end
end
