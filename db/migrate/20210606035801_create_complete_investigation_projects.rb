class CreateCompleteInvestigationProjects < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_investigation_projects
  end
end
