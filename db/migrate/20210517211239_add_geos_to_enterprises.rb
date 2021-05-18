class AddGeosToEnterprises < ActiveRecord::Migration[5.2]
  def change
    add_reference :enterprises, :geo_state, foreign_key: true
    add_reference :enterprises, :geo_country, foreign_key: true
  end
end
