class CreateOtriProfessionals < ActiveRecord::Migration[5.2]
  def change
    create_table :otri_professionals do |t|
      t.string :email
      t.string :phone
      t.references :user, foreign_key: true
      t.references :professional_role, foreign_key: true
      t.bigint :created_by
      t.bigint :updated_by
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :otri_professionals, :created_by
    add_foreign_key :otri_professionals, :users, column: :created_by, primary_key: :id

    add_index :otri_professionals, :updated_by
    add_foreign_key :otri_professionals, :users, column: :updated_by, primary_key: :id
  end
end
