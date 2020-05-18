class AddCountryToFundingEntities < ActiveRecord::Migration[5.2]
  def change
    add_column :funding_entities, :country, :string
  end
end
