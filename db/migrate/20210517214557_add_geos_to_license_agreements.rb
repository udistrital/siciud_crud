class AddGeosToLicenseAgreements < ActiveRecord::Migration[5.2]
  def change
    add_reference :license_agreements, :geo_state, foreign_key: true
    add_reference :license_agreements, :geo_country, foreign_key: true
  end
end
