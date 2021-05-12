class RemoveProductTypeFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_reference :categories, :product_type, foreign_key: true
  end
end
