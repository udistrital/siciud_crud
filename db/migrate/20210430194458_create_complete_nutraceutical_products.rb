class CreateCompleteNutraceuticalProducts < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_nutraceutical_products
  end
end
