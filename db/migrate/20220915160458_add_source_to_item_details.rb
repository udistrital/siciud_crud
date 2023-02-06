class AddSourceToItemDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :item_details, :source_id, :bigint
    add_index :item_details, :source_id
    add_foreign_key :item_details, :subtypes, column: :source_id, primary_key: :id
  end
end
