class AddNameToCalls < ActiveRecord::Migration[5.2]
  def change
    add_column :calls, :name, :string
  end
end
