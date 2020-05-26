class RemoveRequiredFromProductions < ActiveRecord::Migration[5.2]
  def change
    remove_column :productions, :required, :boolean
  end
end
