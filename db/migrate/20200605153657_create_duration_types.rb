class CreateDurationTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :duration_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
