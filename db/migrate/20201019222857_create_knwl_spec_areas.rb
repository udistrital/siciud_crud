class CreateKnwlSpecAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :knwl_spec_areas do |t|
      t.string :name

      t.timestamps
    end
  end
end
