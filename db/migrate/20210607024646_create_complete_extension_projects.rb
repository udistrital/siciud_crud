class CreateCompleteExtensionProjects < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_extension_projects
  end
end
