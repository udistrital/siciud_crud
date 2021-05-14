class AddGeosToResearchCreationWorks < ActiveRecord::Migration[5.2]
  def change
    add_reference :research_creation_works, :geo_state, foreign_key: true
    add_reference :research_creation_works, :geo_country, foreign_key: true
  end
end
