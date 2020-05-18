class AddAddressToFundingEntity < ActiveRecord::Migration[5.2]
  def change
    add_column :funding_entities, :address, :text
  end
end
