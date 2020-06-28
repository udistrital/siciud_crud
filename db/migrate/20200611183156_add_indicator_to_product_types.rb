class AddIndicatorToProductTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :product_types, :indicator, :text
  end
end
