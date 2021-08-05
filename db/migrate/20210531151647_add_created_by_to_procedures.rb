class AddCreatedByToProcedures < ActiveRecord::Migration[5.2]
  def change
    add_column :procedures, :created_by, :bigint
    add_index :procedures, :created_by
    add_foreign_key :procedures, :users, column: :created_by, primary_key: :id
  end
end
