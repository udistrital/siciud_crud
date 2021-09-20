class CreateTechnologicalSituations < ActiveRecord::Migration[5.2]
  def change
    create_table :technological_situations do |t|
      t.bigint :invention_type_id
      t.text :required_equipment
      t.text :pending_development
      t.text :differential_factors
      t.boolean :pi_requested
      t.boolean :media_spread
      t.string :channel_spread
      t.boolean :spread_plans
      t.references :procedure_request, foreign_key: true
      t.bigint :created_by
      t.bigint :updated_by
      t.boolean :active , default: true

      t.timestamps
    end
    add_index :technological_situations, :invention_type_id
    add_foreign_key :technological_situations, :subtypes, column: :invention_type_id, primary_key: :id

    add_index :technological_situations, :created_by
    add_foreign_key :technological_situations, :users, column: :created_by, primary_key: :id

    add_index :technological_situations, :updated_by
    add_foreign_key :technological_situations, :users, column: :updated_by, primary_key: :id
  end
end
