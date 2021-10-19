class DropTableFacultiesResearchNetworks < ActiveRecord::Migration[5.2]
  def change
    drop_table :faculties_research_networks
  end
end
