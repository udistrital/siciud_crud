class AddMobileNumberToFundingEntities < ActiveRecord::Migration[5.2]
  def change
    add_column :funding_entities, :mobileNumber, :string
  end
end
