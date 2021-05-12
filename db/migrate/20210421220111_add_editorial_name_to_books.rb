class AddEditorialNameToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :editorial_name, :string
  end
end
