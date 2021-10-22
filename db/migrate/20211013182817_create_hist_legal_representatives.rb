class CreateHistLegalRepresentatives < ActiveRecord::Migration[5.2]
  def change
    create_table :hist_legal_representatives do |t|
      t.references :legal_representative, foreign_key: true
      t.references :entity, foreign_key: true
      t.boolean :is_current, default: false
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :hist_legal_representatives, :created_by
    add_foreign_key :hist_legal_representatives, :users, column: :created_by, primary_key: :id

    add_index :hist_legal_representatives, :updated_by
    add_foreign_key :hist_legal_representatives, :users, column: :updated_by, primary_key: :id
    
  end
end
