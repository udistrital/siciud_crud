class AddCategoryPsAndColCallToPatents < ActiveRecord::Migration[5.2]
  def change
    add_column :patents, :category_id, :bigint
    add_index :patents, :category_id
    add_foreign_key :patents, :subtypes, column: :category_id, primary_key: :id

    add_reference :patents, :colciencias_call, foreign_key: true

    add_column :patents, :patent_state_id, :bigint
    add_index :patents, :patent_state_id
    add_foreign_key :patents, :subtypes, column: :patent_state_id, primary_key: :id
  end
end
