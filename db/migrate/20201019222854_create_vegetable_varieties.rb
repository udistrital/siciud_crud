class CreateVegetableVarieties < ActiveRecord::Migration[5.2]
  def change
    create_table :vegetable_varieties do |t|
      t.string :name
      t.date :date
      t.text :observation
      t.references :cycle_type, foreign_key: true
      t.references :petition_status, foreign_key: true
      t.references :category, foreign_key: true
      t.references :research_group, foreign_key: true

      t.timestamps
    end
  end
end
