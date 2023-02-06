class CreateInventoryHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :inventory_histories do |t|
      t.references :form_e_act_plan, foreign_key: true
      t.bigint :state_id
      t.references :usable, polymorphic: true
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :inventory_histories, :state_id
    add_foreign_key :inventory_histories, :subtypes, column: :state_id, primary_key: :id

    add_index :inventory_histories, :created_by
    add_foreign_key :inventory_histories, :users, column: :created_by, primary_key: :id

    add_index :inventory_histories, :updated_by
    add_foreign_key :inventory_histories, :users, column: :updated_by, primary_key: :id
  end
end
