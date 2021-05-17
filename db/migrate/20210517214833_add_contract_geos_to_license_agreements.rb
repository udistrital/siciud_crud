class AddContractGeosToLicenseAgreements < ActiveRecord::Migration[5.2]
  def change
    add_column :license_agreements, :contract_geo_state_id, :bigint
    add_index :license_agreements, :contract_geo_state_id
    add_foreign_key :license_agreements, :geo_states, column: :contract_geo_state_id, primary_key: :id

    add_column :license_agreements, :contract_geo_country_id, :bigint
    add_index :license_agreements, :contract_geo_country_id
    add_foreign_key :license_agreements, :geo_countries, column: :contract_geo_country_id, primary_key: :id
  end
end
