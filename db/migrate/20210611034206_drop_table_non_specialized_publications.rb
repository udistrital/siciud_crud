class DropTableNonSpecializedPublications < ActiveRecord::Migration[5.2]
  def change
    drop_table :non_specialized_publications
  end
end
