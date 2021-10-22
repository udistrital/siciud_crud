class CreateProfessionalRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :professional_roles do |t|
      t.string :name
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end
    add_index :professional_roles, :created_by
    add_foreign_key :professional_roles, :users, column: :created_by, primary_key: :id
    add_index :professional_roles, :updated_by
    add_foreign_key :professional_roles, :users, column: :updated_by, primary_key: :id
  end
end
