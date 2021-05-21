class AddGeosToClinicalPracticeGuidelines < ActiveRecord::Migration[5.2]
  def change
    add_reference :clinical_practice_guidelines, :geo_state, foreign_key: true
    add_reference :clinical_practice_guidelines, :geo_country, foreign_key: true
  end
end
