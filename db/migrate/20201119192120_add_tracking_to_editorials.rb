class AddTrackingToEditorials < ActiveRecord::Migration[5.2]
  def change
    add_column :editorials, :active, :boolean, default: true

    add_column :editorials, :created_by, :bigint
    add_index :editorials, :created_by
    add_foreign_key :editorials, :users, column: :created_by, primary_key: :id

    add_column :editorials, :updated_by, :bigint
    add_index :editorials, :updated_by
    add_foreign_key :editorials, :users, column: :updated_by, primary_key: :id
  end
end
