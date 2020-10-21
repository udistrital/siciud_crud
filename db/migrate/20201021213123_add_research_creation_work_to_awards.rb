class AddResearchCreationWorkToAwards < ActiveRecord::Migration[5.2]
  def change
    add_reference :awards, :research_creation_work, foreign_key: true
  end
end
