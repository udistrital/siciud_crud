class CreateCompleteIdiInvestigationProjects < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_idi_investigation_projects
  end
end
