class AddTypesFromSubtypesToVegetableVarieties < ActiveRecord::Migration[5.2]
  def change
    add_column :vegetable_varieties, :category_id, :bigint
    add_index :vegetable_varieties, :category_id
    add_foreign_key :vegetable_varieties, :subtypes, column: :category_id, primary_key: :id

    add_reference :vegetable_varieties, :colciencias_call, foreign_key: true

    add_column :vegetable_varieties, :cycle_type_id, :bigint
    add_index :vegetable_varieties, :cycle_type_id
    add_foreign_key :vegetable_varieties, :subtypes, column: :cycle_type_id, primary_key: :id

    add_column :vegetable_varieties, :petition_status_id, :bigint
    add_index :vegetable_varieties, :petition_status_id
    add_foreign_key :vegetable_varieties, :subtypes, column: :petition_status_id, primary_key: :id
  end
end
