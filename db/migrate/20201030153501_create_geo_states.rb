class CreateGeoStates < ActiveRecord::Migration[5.2]
  def change
    create_table :geo_states do |t|
      t.string :name
      t.string :code, limit: 10
      t.references :geo_country, foreign_key: true

      t.timestamps
    end
  end
end
