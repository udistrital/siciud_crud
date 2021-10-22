class CreateCompleteResearchNetworks < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_research_networks
  end
end
