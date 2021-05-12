class CreateCompleteLicenseAgreements < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_license_agreements
  end
end
