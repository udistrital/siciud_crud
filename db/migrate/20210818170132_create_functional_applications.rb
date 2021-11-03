class CreateFunctionalApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :functional_applications do |t|
      t.text :actual_applications
      t.text :future_applications
      t.string :alternative_technologies
      t.text :advantages
      t.references :procedure_request, foreign_key: true
      t.bigint :created_by
      t.bigint :updated_by
      t.boolean :active, default: true
      t.timestamps
    end
    add_index :functional_applications, :created_by
    add_foreign_key :functional_applications, :users, column: :created_by, primary_key: :id

    add_index :functional_applications, :updated_by
    add_foreign_key :functional_applications, :users, column: :updated_by, primary_key: :id
  end
end
