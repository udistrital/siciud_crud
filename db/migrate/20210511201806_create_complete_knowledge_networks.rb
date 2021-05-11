class CreateCompleteKnowledgeNetworks < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_knowledge_networks
  end
end
