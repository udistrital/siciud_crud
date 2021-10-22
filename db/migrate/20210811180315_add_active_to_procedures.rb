class AddActiveToProcedures < ActiveRecord::Migration[5.2]
  def change
    add_column :procedures, :active, :boolean, default: true
  end
end
