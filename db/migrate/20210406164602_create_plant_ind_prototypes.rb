class CreatePlantIndPrototypes < ActiveRecord::Migration[5.2]
  def change
    create_table :plant_ind_prototypes do |t|
      t.string :plt_name
      t.string :plt_registration_number
      t.date :plt_date_of_elaboration
      t.references :geo_country, foreign_key: true
      t.bigint :category_id
      t.references :research_group, foreign_key: true
      t.references :colciencias_call, foreign_key: true
      t.text :observation
      t.bigint :plt_type_id
      t.boolean :active
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :plant_ind_prototypes, :category_id
    add_foreign_key :plant_ind_prototypes, :subtypes, column: :category_id, primary_key: :id

    add_index :plant_ind_prototypes, :plt_type_id
    add_foreign_key :plant_ind_prototypes, :subtypes, column: :plt_type_id, primary_key: :id

    add_index :plant_ind_prototypes, :created_by
    add_foreign_key :plant_ind_prototypes, :users, column: :created_by, primary_key: :id

    add_index :plant_ind_prototypes, :updated_by
    add_foreign_key :plant_ind_prototypes, :users, column: :updated_by, primary_key: :id
  end
end
