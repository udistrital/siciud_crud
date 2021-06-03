class AddGeosToGuideManuals < ActiveRecord::Migration[5.2]
  def change
    add_reference :guide_manuals, :geo_state, foreign_key: true
    add_reference :guide_manuals, :geo_country, foreign_key: true
  end
end
