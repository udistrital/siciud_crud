class AddTrackingToJournals < ActiveRecord::Migration[5.2]
  def change
    add_column :journals, :active, :boolean, default: true

    add_column :journals, :created_by, :bigint
    add_index :journals, :created_by
    add_foreign_key :journals, :users, column: :created_by, primary_key: :id

    add_column :journals, :updated_by, :bigint
    add_index :journals, :updated_by
    add_foreign_key :journals, :users, column: :updated_by, primary_key: :id
  end
end
