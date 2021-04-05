class CreateIndustrialDesigns < ActiveRecord::Migration[5.2]
  def change
    create_table :industrial_designs do |t|
      t.string :ind_dsg_registration_number
      t.string :ind_dsg_registration_title
      t.date :ind_dsg_date_of_obtaining
      t.references :geo_country, foreign_key: true
      t.string :ind_dsg_industrial_publication_gazette
      t.bigint :category_id
      t.references :research_group, foreign_key: true
      t.references :colciencias_call, foreign_key: true
      t.text :observation
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :industrial_designs, :category_id
    add_foreign_key :industrial_designs, :subtypes, column: :category_id, primary_key: :id

    add_index :industrial_designs, :created_by
    add_foreign_key :industrial_designs, :users, column: :created_by, primary_key: :id

    add_index :industrial_designs, :updated_by
    add_foreign_key :industrial_designs, :users, column: :updated_by, primary_key: :id

  end
end
