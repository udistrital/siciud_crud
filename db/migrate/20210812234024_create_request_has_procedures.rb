class CreateRequestHasProcedures < ActiveRecord::Migration[5.2]
  def change
    create_table :request_has_procedures do |t|
      t.references :procedure, foreign_key: true
      t.references :procedure_request, foreign_key: true
      t.bigint :created_by
      t.bigint :updated_by
      t.boolean :active, default: true

      t.timestamps
    end

    add_index :request_has_procedures, :created_by
    add_foreign_key :request_has_procedures, :users, column: :created_by, primary_key: :id

    add_index :request_has_procedures, :updated_by
    add_foreign_key :request_has_procedures, :users, column: :updated_by, primary_key: :id
  end
end
