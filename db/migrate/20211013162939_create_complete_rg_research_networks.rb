class CreateCompleteRgResearchNetworks < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_rg_research_networks
  end
end
