class AddGeosToNutraceuticalProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :nutraceutical_products, :geo_state, foreign_key: true
    add_reference :nutraceutical_products, :geo_country, foreign_key: true
  end
end
