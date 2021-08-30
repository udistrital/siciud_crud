class CreateSnies < ActiveRecord::Migration[5.2]
  def change
    create_table :snies do |t|
      t.string :code
      t.string :name
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :snies, :created_by
    add_foreign_key :snies, :users, column: :created_by, primary_key: :id

    add_index :snies, :updated_by
    add_foreign_key :snies, :users, column: :updated_by, primary_key: :id
  end
end
