class AddCityToFundingEntities < ActiveRecord::Migration[5.2]
  def change
    add_column :funding_entities, :city, :string
  end
end
