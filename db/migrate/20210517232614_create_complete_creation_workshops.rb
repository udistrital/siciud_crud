class CreateCompleteCreationWorkshops < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_creation_workshops
  end
end
