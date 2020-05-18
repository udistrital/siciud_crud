class AddObservationToFundingEntity < ActiveRecord::Migration[5.2]
  def change
    add_column :funding_entities, :observation, :text
  end
end
