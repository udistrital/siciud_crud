class CreateDependencies < ActiveRecord::Migration[5.2]
  def change
    create_table :dependencies do |t|
      t.string :name
      t.references :entity, foreign_key: true
      t.boolean :active, default: true 
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :dependencies, :created_by
    add_foreign_key :dependencies, :users, column: :created_by, primary_key: :id

    add_index :dependencies, :updated_by
    add_foreign_key :dependencies, :users, column: :updated_by, primary_key: :id

  end
end
