class AddEntityTypeToFundingEntities < ActiveRecord::Migration[5.2]
  def change
    add_reference :funding_entities, :entity_type, foreign_key: true
  end
end
