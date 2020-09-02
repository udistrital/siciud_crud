class CreateCineDetailedAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :cine_detailed_areas do |t|
      t.string :code
      t.string :name
      t.references :cine_specific_area, foreign_key: true

      t.timestamps
    end
  end
end
