class CreateProductions < ActiveRecord::Migration[5.2]
  def change
    create_table :productions do |t|
      t.string :deliverables_name
      t.text :indicator
      t.boolean :required
      t.integer :quantity

      t.timestamps
    end
  end
end
