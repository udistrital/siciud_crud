class CreateGeoCities < ActiveRecord::Migration[5.2]
  def change
    create_table :geo_cities do |t|
      t.string :name
      t.string :code, limit: 10
      t.float :latitude
      t.float :longitude
      t.references :geo_state, foreign_key: true

      t.timestamps
    end
  end
end
