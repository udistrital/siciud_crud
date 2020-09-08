class CreateCurricularPrjIdsResearchGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :curricular_prj_ids_research_groups do |t|
      t.references :research_group, foreign_key: true
      t.integer :curricular_projectId

      t.timestamps
    end
  end
end
