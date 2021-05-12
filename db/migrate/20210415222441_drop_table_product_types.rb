class DropTableProductTypes < ActiveRecord::Migration[5.2]
  def change
    drop_table :product_types
  end
end
