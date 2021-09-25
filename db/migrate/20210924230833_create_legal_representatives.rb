class CreateLegalRepresentatives < ActiveRecord::Migration[5.2]
  def change
    create_table :legal_representatives do |t|
      t.string :name
      t.string :identification_number
      t.string :email
      t.bigint :identification_type_id
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :legal_representatives, :identification_type_id
    add_foreign_key :legal_representatives, :subtypes, column: :identification_type_id, primary_key: :id

    add_index :legal_representatives, :created_by
    add_foreign_key :legal_representatives, :users, column: :created_by, primary_key: :id

    add_index :legal_representatives, :updated_by
    add_foreign_key :legal_representatives, :users, column: :updated_by, primary_key: :id

  end
end
