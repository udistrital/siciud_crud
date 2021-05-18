class AddGeosToTechnicalConcepts < ActiveRecord::Migration[5.2]
  def change
    add_reference :technical_concepts, :geo_state, foreign_key: true
    add_reference :technical_concepts, :geo_country, foreign_key: true
  end
end
