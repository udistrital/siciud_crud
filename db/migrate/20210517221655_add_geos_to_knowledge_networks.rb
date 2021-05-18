class AddGeosToKnowledgeNetworks < ActiveRecord::Migration[5.2]
  def change
    add_reference :knowledge_networks, :geo_state, foreign_key: true
    add_reference :knowledge_networks, :geo_country, foreign_key: true
  end
end
