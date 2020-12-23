class AddGeoCityToResearchCreationWorks < ActiveRecord::Migration[5.2]
  def change
    add_reference :research_creation_works, :geo_city, foreign_key: true
  end
end
