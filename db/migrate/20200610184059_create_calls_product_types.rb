class CreateCallsProductTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :calls_product_types do |t|
      t.boolean :required
      t.integer :quantity
      t.references :call, foreign_key: true
      t.references :product_type, foreign_key: true

      t.timestamps
    end
  end
end
