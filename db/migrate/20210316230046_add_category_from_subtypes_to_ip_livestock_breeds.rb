class AddCategoryFromSubtypesToIpLivestockBreeds < ActiveRecord::Migration[5.2]
  def change
    add_column :ip_livestock_breeds, :category_id, :bigint
    add_index :ip_livestock_breeds, :category_id
    add_foreign_key :ip_livestock_breeds, :subtypes, column: :category_id, primary_key: :id

    add_reference :ip_livestock_breeds, :colciencias_call, foreign_key: true
  end
end
