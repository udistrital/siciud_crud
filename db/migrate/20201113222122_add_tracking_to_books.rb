class AddTrackingToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :active, :boolean, default: true
    add_column :books, :created_by, :bigint
    add_column :books, :updated_by, :bigint
  end
end
