class CreateAccompanimentConsultancies < ActiveRecord::Migration[5.2]
  def change
    create_table :accompaniment_consultancies do |t|
      t.string :institution
      t.string :project_name
      t.date :date
      t.references :geo_city, foreign_key: true
      t.references :geo_state, foreign_key: true
      t.references :geo_country, foreign_key: true
      t.bigint :category_id
      t.references :research_group, foreign_key: true
      t.references :colciencias_call, foreign_key: true
      t.text :observation
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end
    add_index :accompaniment_consultancies, :category_id
    add_foreign_key :accompaniment_consultancies, :subtypes, column: :category_id, primary_key: :id

    add_index :accompaniment_consultancies, :created_by
    add_foreign_key :accompaniment_consultancies, :users, column: :created_by, primary_key: :id

    add_index :accompaniment_consultancies, :updated_by
    add_foreign_key :accompaniment_consultancies, :users, column: :updated_by, primary_key: :id
  end
end
