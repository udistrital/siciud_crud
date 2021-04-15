class DropTableProductTypologies < ActiveRecord::Migration[5.2]
  def change
    drop_table :product_typologies
  end
end
