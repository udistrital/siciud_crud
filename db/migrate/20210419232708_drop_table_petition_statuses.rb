class DropTablePetitionStatuses < ActiveRecord::Migration[5.2]
  def change
    drop_table :petition_statuses
  end
end
