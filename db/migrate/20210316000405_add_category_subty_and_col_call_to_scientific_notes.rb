class AddCategorySubtyAndColCallToScientificNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :scientific_notes, :category_id, :bigint
    add_index :scientific_notes, :category_id
    add_foreign_key :scientific_notes, :subtypes, column: :category_id, primary_key: :id

    add_reference :scientific_notes, :colciencias_call, foreign_key: true
  end
end
