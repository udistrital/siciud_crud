class AddSubtypesAndColCallToPapers < ActiveRecord::Migration[5.2]
  def change
    add_column :papers, :category_id, :bigint
    add_index :papers, :category_id
    add_foreign_key :papers, :subtypes, column: :category_id, primary_key: :id

    add_column :papers, :paper_type_id, :bigint
    add_index :papers, :paper_type_id
    add_foreign_key :papers, :subtypes, column: :paper_type_id, primary_key: :id

    add_reference :papers, :colciencias_call, foreign_key: true
  end
end
