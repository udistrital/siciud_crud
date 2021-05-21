class CreateInstitutions < ActiveRecord::Migration[5.2]
  def change
    create_table :institutions do |t|
      t.string :inst_name
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :institutions, :created_by
    add_foreign_key :institutions, :users, column: :created_by, primary_key: :id

    add_index :institutions, :updated_by
    add_foreign_key :institutions, :users, column: :updated_by, primary_key: :id

  end
end
