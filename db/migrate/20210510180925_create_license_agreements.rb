class CreateLicenseAgreements < ActiveRecord::Migration[5.2]
  def change
    create_table :license_agreements do |t|
      t.string :work_name
      t.date :license_grant_date
      t.date :contract_date
      t.string :ncd_registry_number
      t.string :license_owner_institution
      t.references :geo_city, foreign_key: true
      t.bigint :contract_geo_city_id
      t.bigint :category_id
      t.references :research_group, foreign_key: true
      t.references :colciencias_call, foreign_key: true
      t.text :observation
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end
    
    add_index :license_agreements, :category_id
    add_foreign_key :license_agreements, :subtypes, column: :category_id, primary_key: :id

    add_index :license_agreements, :contract_geo_city_id
    add_foreign_key :license_agreements, :geo_cities, column: :contract_geo_city_id, primary_key: :id

    add_index :license_agreements, :created_by
    add_foreign_key :license_agreements, :users, column: :created_by, primary_key: :id

    add_index :license_agreements, :updated_by
    add_foreign_key :license_agreements, :users, column: :updated_by, primary_key: :id

  end
end
