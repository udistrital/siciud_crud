class CreateProtocolActs < ActiveRecord::Migration[5.2]
  def change
    create_table :protocol_acts do |t|
      t.string :title
      t.date :date_of_publication
      t.references :geo_city, foreign_key: true
      t.bigint :category_id
      t.bigint :product_type_id
      t.references :research_group, foreign_key: true
      t.references :colciencias_call, foreign_key: true
      t.text :observation
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :protocol_acts, :category_id
    add_foreign_key :protocol_acts, :subtypes, column: :category_id, primary_key: :id

    add_index :protocol_acts, :product_type_id
    add_foreign_key :protocol_acts, :subtypes, column: :product_type_id, primary_key: :id

    add_index :protocol_acts, :created_by
    add_foreign_key :protocol_acts, :users, column: :created_by, primary_key: :id

    add_index :protocol_acts, :updated_by
    add_foreign_key :protocol_acts, :users, column: :updated_by, primary_key: :id
  end
end
