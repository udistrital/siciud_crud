class CreateCompleteRoles < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_roles
  end
end
