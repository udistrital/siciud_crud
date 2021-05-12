class DropTableEditorials < ActiveRecord::Migration[5.2]
  def change
    drop_table :editorials
  end
end
