class DropTablePaperTypes < ActiveRecord::Migration[5.2]
  def change
    drop_table :paper_types
  end
end
