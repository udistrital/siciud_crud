class CreateThematicAxes < ActiveRecord::Migration[5.2]
  def change
    create_table :thematic_axes do |t|
      t.string :name

      t.timestamps
    end
  end
end
