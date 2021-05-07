class CreateClinicalPracticeGuidelines < ActiveRecord::Migration[5.2]
  def change
    create_table :clinical_practice_guidelines do |t|
      t.string :title
      t.date :date_of_publication
      t.string :isbn
      t.references :geo_city, foreign_key: true
      t.bigint :category_id
      t.references :research_group, foreign_key: true
      t.references :colciencias_call, foreign_key: true
      t.text :observation
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :clinical_practice_guidelines, :category_id
    add_foreign_key :clinical_practice_guidelines, :subtypes, column: :category_id, primary_key: :id

    add_index :clinical_practice_guidelines, :created_by
    add_foreign_key :clinical_practice_guidelines, :users, column: :created_by, primary_key: :id

    add_index :clinical_practice_guidelines, :updated_by
    add_foreign_key :clinical_practice_guidelines, :users, column: :updated_by, primary_key: :id

  end
end
