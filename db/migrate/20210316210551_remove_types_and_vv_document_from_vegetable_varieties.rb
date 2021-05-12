class RemoveTypesAndVvDocumentFromVegetableVarieties < ActiveRecord::Migration[5.2]
  def change
    remove_reference :vegetable_varieties, :cycle_type, foreign_key: true
    remove_reference :vegetable_varieties, :petition_status, foreign_key: true
    remove_reference :vegetable_varieties, :category, foreign_key: true
    remove_column :vegetable_varieties, :vegetable_variety_document, :string
  end
end
