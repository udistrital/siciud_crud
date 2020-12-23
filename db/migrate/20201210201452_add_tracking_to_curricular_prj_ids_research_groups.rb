class AddTrackingToCurricularPrjIdsResearchGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :curricular_prj_ids_research_groups, :active, :boolean, default: true

    add_column :curricular_prj_ids_research_groups, :created_by, :bigint
    add_index :curricular_prj_ids_research_groups, :created_by
    add_foreign_key :curricular_prj_ids_research_groups, :users, column: :created_by, primary_key: :id

    add_column :curricular_prj_ids_research_groups, :updated_by, :bigint
    add_index :curricular_prj_ids_research_groups, :updated_by
    add_foreign_key :curricular_prj_ids_research_groups, :users, column: :updated_by, primary_key: :id

    change_column_default :curricular_prj_ids_research_groups, :created_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
    change_column_default :curricular_prj_ids_research_groups, :updated_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
  end
end
