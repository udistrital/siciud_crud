class CreateCineBroadAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :cine_broad_areas do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
