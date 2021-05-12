class CreateIntegratedCircuitDiagrams < ActiveRecord::Migration[5.2]
  def change
    create_table :integrated_circuit_diagrams do |t|
      t.string :icd_registration_number
      t.string :icd_registration_title
      t.date :icd_date_of_obtaining
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

    add_index :integrated_circuit_diagrams, :category_id
    add_foreign_key :integrated_circuit_diagrams, :subtypes, column: :category_id, primary_key: :id

    add_index :integrated_circuit_diagrams, :created_by
    add_foreign_key :integrated_circuit_diagrams, :users, column: :created_by, primary_key: :id

    add_index :integrated_circuit_diagrams, :updated_by
    add_foreign_key :integrated_circuit_diagrams, :users, column: :updated_by, primary_key: :id

  end
end
