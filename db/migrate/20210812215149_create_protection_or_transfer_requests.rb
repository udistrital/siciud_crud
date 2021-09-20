class CreateProtectionOrTransferRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :procedure_requests do |t|
      t.text :approached_problem
      t.bigint :created_by
      t.bigint :updated_by
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :procedure_requests, :created_by
    add_foreign_key :procedure_requests, :users, column: :created_by, primary_key: :id

    add_index :procedure_requests, :updated_by
    add_foreign_key :procedure_requests, :users, column: :updated_by, primary_key: :id
  end
end
