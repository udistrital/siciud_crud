class AddAlternateIndicatorToCallsProductTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :calls_product_types, :alternate_indicator, :text
  end
end
