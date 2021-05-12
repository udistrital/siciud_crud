class RemoveProductTypeFromCallsProductTypes < ActiveRecord::Migration[5.2]
  def change
    remove_reference :calls_product_types, :product_type, foreign_key: true
  end
end
