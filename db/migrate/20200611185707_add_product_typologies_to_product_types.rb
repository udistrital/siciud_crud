class AddProductTypologiesToProductTypes < ActiveRecord::Migration[5.2]
  def change
    add_reference :product_types, :product_typology, foreign_key: true
  end
end
