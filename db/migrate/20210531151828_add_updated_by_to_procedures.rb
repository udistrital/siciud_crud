class AddUpdatedByToProcedures < ActiveRecord::Migration[5.2]
  def change
    add_column :procedures, :updated_by, :bigint
    add_index :procedures, :updated_by
    add_foreign_key :procedures, :users, column: :updated_by, primary_key: :id
  end
end
