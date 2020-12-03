class AddTrackingToResearchers < ActiveRecord::Migration[5.2]
  def change
    add_column :researchers, :active, :boolean

    add_column :researchers, :created_by, :bigint
    add_index :researchers, :created_by
    add_foreign_key :researchers, :users, column: :created_by, primary_key: :id

    add_column :researchers, :updated_by, :bigint
    add_index :researchers, :updated_by
    add_foreign_key :researchers, :users, column: :updated_by, primary_key: :id
  end
end
