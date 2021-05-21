class CreateCompleteTechnicalConcepts < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_technical_concepts
  end
end
