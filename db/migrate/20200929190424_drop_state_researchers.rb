class DropStateResearchers < ActiveRecord::Migration[5.2]
  def change
    drop_table :state_researchers
  end
end
