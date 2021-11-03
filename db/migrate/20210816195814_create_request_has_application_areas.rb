class CreateRequestHasApplicationAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :request_has_application_areas do |t|
      t.references :procedure_request, foreign_key: true
      t.bigint :application_area_id
      t.bigint :created_by
      t.bigint :updated_by
      t.boolean :active , default: true

      t.timestamps
    end

    add_index :request_has_application_areas, :application_area_id
    add_foreign_key :request_has_application_areas, :subtypes, column: :application_area_id, primary_key: :id

    add_index :request_has_application_areas, :created_by
    add_foreign_key :request_has_application_areas, :users, column: :created_by, primary_key: :id

    add_index :request_has_application_areas, :updated_by
    add_foreign_key :request_has_application_areas, :users, column: :updated_by, primary_key: :id
  end
end
