class AddGeosToScientificNotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :scientific_notes, :geo_state, foreign_key: true
    add_reference :scientific_notes, :geo_country, foreign_key: true
  end
end
