class CreateJoinTableTechnologicalSituationSubType2 < ActiveRecord::Migration[5.2]
  def change
    create_join_table :technological_situations, :subtypes , table_name: :technological_situations_technology_reasons do |t|
      # t.index [:technological_situation_id, :subtype_id]
      # t.index [:subtype_id, :technological_situation_id]
    end
  end
end
