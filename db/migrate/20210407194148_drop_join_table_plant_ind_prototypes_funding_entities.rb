class DropJoinTablePlantIndPrototypesFundingEntities < ActiveRecord::Migration[5.2]
  def change
    drop_join_table :plant_ind_prototypes, :funding_entities do |t|
      # t.index [:plant_ind_prototype_id, :funding_entity_id]
      # t.index [:funding_entity_id, :plant_ind_prototype_id]
    end

  end
end
