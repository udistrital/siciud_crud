class CreateProductTypologies < ActiveRecord::Migration[5.2]
  def change
    create_table :product_typologies do |t|
      t.string :name

      t.timestamps
    end
  end
end
