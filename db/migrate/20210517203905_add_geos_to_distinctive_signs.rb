class AddGeosToDistinctiveSigns < ActiveRecord::Migration[5.2]
  def change
    add_reference :distinctive_signs, :geo_state, foreign_key: true
    add_reference :distinctive_signs, :geo_country, foreign_key: true
  end
end
