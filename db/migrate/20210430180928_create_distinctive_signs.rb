class CreateDistinctiveSigns < ActiveRecord::Migration[5.2]
  def change
    create_table :distinctive_signs do |t|
      t.string :registration_title
      t.string :registration_number
      t.date :date_of_obtaining
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

    add_index :distinctive_signs, :category_id
    add_foreign_key :distinctive_signs, :subtypes, column: :category_id, primary_key: :id

    add_index :distinctive_signs, :created_by
    add_foreign_key :distinctive_signs, :users, column: :created_by, primary_key: :id

    add_index :distinctive_signs, :updated_by
    add_foreign_key :distinctive_signs, :users, column: :updated_by, primary_key: :id

  end
end
