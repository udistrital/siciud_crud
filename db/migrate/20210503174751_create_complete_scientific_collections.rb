class CreateCompleteScientificCollections < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_scientific_collections
  end
end
