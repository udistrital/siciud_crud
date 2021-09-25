class CreateEntities < ActiveRecord::Migration[5.2]
  def change
    create_table :entities do |t|
      t.string :name
      t.string :nit
      t.integer :check_digit
      t.date :constitution_date
      t.bigint :legal_nature_id
      t.references :legal_representative, foreign_key: true
      t.bigint :institution_type_id
      t.references :geo_city, foreign_key: true
      t.references :geo_country, foreign_key: true
      t.references :geo_state, foreign_key: true
      t.string :headquarters_address
      t.string :email
      t.string :phone
      t.string :registration
      t.string :web_page
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :entities, :legal_nature_id
    add_foreign_key :entities, :subtypes, column: :legal_nature_id, primary_key: :id

    add_index :entities, :institution_type_id
    add_foreign_key :entities, :subtypes, column: :institution_type_id, primary_key: :id

    add_index :entities, :created_by
    add_foreign_key :entities, :users, column: :created_by, primary_key: :id

    add_index :entities, :updated_by
    add_foreign_key :entities, :users, column: :updated_by, primary_key: :id
  end
end
