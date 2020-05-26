class RemoveQuantityFromProductions < ActiveRecord::Migration[5.2]
  def change
    remove_column :productions, :quantity, :integer
  end
end
