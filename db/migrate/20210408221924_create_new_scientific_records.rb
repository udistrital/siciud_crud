class CreateNewScientificRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :new_scientific_records do |t|
      t.string :nsr_name
      t.date :nsr_date_of_obtaining
      t.string :nsr_database_name
      t.string :nsr_database_url
      t.string :nsr_certifying_institution
      t.string :nsr_issuing_institution
      t.references :geo_country, foreign_key: true
      t.bigint :category_id
      t.references :research_group, foreign_key: true
      t.references :colciencias_call, foreign_key: true
      t.text :observation
      t.boolean :active
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :new_scientific_records, :category_id
    add_foreign_key :new_scientific_records, :subtypes, column: :category_id, primary_key: :id

    add_index :new_scientific_records, :created_by
    add_foreign_key :new_scientific_records, :users, column: :created_by, primary_key: :id

    add_index :new_scientific_records, :updated_by
    add_foreign_key :new_scientific_records, :users, column: :updated_by, primary_key: :id
    
  end
end
