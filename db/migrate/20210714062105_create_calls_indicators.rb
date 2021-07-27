class CreateCallsIndicators < ActiveRecord::Migration[5.2]
  def change
    create_table :calls_indicators do |t|
      t.references :call, foreign_key: true
      t.references :indicator, foreign_key: true
      t.boolean :clind_required
      t.integer :clind_quantity
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :calls_indicators, :created_by
    add_foreign_key :calls_indicators, :users, column: :created_by, primary_key: :id

    add_index :calls_indicators, :updated_by
    add_foreign_key :calls_indicators, :users, column: :updated_by, primary_key: :id
  end
end
