class AddIndexAndFkTrackingToBooks < ActiveRecord::Migration[5.2]
  def change
    add_index :books, :created_by
    add_foreign_key :books, :users, column: :created_by, primary_key: :id

    add_index :books, :updated_by
    add_foreign_key :books, :users, column: :updated_by, primary_key: :id
  end
end
