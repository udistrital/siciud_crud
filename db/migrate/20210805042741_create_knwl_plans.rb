class CreateKnwlPlans < ActiveRecord::Migration[5.2]
  def change
    create_table :knwl_plans do |t|
      t.references :knwl_area, polymorphic: true
      t.references :form_d_act_plan, foreign_key: true
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :knwl_plans, :created_by
    add_foreign_key :knwl_plans, :users, column: :created_by, primary_key: :id

    add_index :knwl_plans, :updated_by
    add_foreign_key :knwl_plans, :users, column: :updated_by, primary_key: :id
  end
end
