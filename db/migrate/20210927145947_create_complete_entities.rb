class CreateCompleteEntities < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_entities
  end
end
