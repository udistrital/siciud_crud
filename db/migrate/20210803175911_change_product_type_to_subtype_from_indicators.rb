class ChangeProductTypeToSubtypeFromIndicators < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :indicators, :subtypes
    remove_index :indicators, :product_type_id

    rename_column :indicators, :product_type_id, :subtype_id

    add_index :indicators, :subtype_id
    add_foreign_key :indicators, :subtypes, column: :subtype_id, primary_key: :id
  end
end
