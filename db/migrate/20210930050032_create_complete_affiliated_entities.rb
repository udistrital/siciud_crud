class CreateCompleteAffiliatedEntities < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_affiliated_entities
  end
end
