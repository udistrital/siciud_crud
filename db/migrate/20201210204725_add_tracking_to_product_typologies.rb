class AddTrackingToProductTypologies < ActiveRecord::Migration[5.2]
  def change
    add_column :product_typologies, :active, :boolean, default: true

    add_column :product_typologies, :created_by, :bigint
    add_index :product_typologies, :created_by
    add_foreign_key :product_typologies, :users, column: :created_by, primary_key: :id

    add_column :product_typologies, :updated_by, :bigint
    add_index :product_typologies, :updated_by
    add_foreign_key :product_typologies, :users, column: :updated_by, primary_key: :id

    change_column_default :product_typologies, :created_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
    change_column_default :product_typologies, :updated_at, from: nil, to: -> {'CURRENT_TIMESTAMP'}
  end
end
