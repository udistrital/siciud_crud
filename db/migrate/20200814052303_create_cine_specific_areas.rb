class CreateCineSpecificAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :cine_specific_areas do |t|
      t.string :name
      t.string :code
      t.references :cine_broad_area, foreign_key: true

      t.timestamps
    end
  end
end
