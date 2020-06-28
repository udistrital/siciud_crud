class RemoveRequiredFromCallsProductTypes < ActiveRecord::Migration[5.2]
  def change
    remove_column :calls_product_types, :required, :boolean
  end
end
