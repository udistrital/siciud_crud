class AddIndexAndFkTrackingToUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :created_by
    add_foreign_key :users, :users, column: :created_by, primary_key: :id

    add_index :users, :updated_by
    add_foreign_key :users, :users, column: :updated_by, primary_key: :id
  end
end
