class DropTableJournals < ActiveRecord::Migration[5.2]
  def change
    drop_table :journals
  end
end
