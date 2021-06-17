class CreateCompleteContentGenerations < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_content_generations
  end
end
