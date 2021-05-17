class CreateCreationWorkshops < ActiveRecord::Migration[5.2]
  def change
    create_table :creation_workshops do |t|
      t.string :name
      t.date :start_date
      t.date :finish_date
      t.string :funding_institution
      t.string :organization_name
      t.references :geo_city, foreign_key: true
      t.references :geo_state, foreign_key: true
      t.references :geo_country, foreign_key: true
      t.bigint :participation_id
      t.bigint :category_id
      t.references :research_group, foreign_key: true
      t.references :colciencias_call, foreign_key: true
      t.text :observation
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :creation_workshops, :category_id
    add_foreign_key :creation_workshops, :subtypes, column: :category_id, primary_key: :id

    add_index :creation_workshops, :participation_id
    add_foreign_key :creation_workshops, :subtypes, column: :participation_id, primary_key: :id

    add_index :creation_workshops, :created_by
    add_foreign_key :creation_workshops, :users, column: :created_by, primary_key: :id

    add_index :creation_workshops, :updated_by
    add_foreign_key :creation_workshops, :users, column: :updated_by, primary_key: :id

  end
end
