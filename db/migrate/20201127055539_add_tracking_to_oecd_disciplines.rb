class AddTrackingToOecdDisciplines < ActiveRecord::Migration[5.2]
  def change
    add_column :oecd_disciplines, :active, :boolean, default: true

    add_column :oecd_disciplines, :created_by, :bigint
    add_index :oecd_disciplines, :created_by
    add_foreign_key :oecd_disciplines, :users, column: :created_by, primary_key: :id

    add_column :oecd_disciplines, :updated_by, :bigint
    add_index :oecd_disciplines, :updated_by
    add_foreign_key :oecd_disciplines, :users, column: :updated_by, primary_key: :id
  end
end
