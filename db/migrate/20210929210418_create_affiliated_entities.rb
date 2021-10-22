class CreateAffiliatedEntities < ActiveRecord::Migration[5.2]
  def change
    create_table :affiliated_entities do |t|
      t.references :research_network, foreign_key: true
      t.references :entity, foreign_key: true
      t.bigint :institution_type_id
      t.references :geo_country, foreign_key: true
      t.boolean :active, default: true 
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :affiliated_entities, :institution_type_id
    add_foreign_key :affiliated_entities, :subtypes, column: :institution_type_id, primary_key: :id

    add_index :affiliated_entities, :created_by
    add_foreign_key :affiliated_entities, :users, column: :created_by, primary_key: :id

    add_index :affiliated_entities, :updated_by
    add_foreign_key :affiliated_entities, :users, column: :updated_by, primary_key: :id
  end
end
