class AddGeoCityToScientificNotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :scientific_notes, :geo_city, foreign_key: true
  end
end
