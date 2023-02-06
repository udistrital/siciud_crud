class CreateAnonymousEvaluators < ActiveRecord::Migration[5.2]
  def change
    create_table :anonymous_evaluators do |t|
      t.string :code
      t.decimal :total, precision: 5, scale: 2
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :anonymous_evaluators, :code

    add_index :anonymous_evaluators, :created_by
    add_foreign_key :anonymous_evaluators, :users, column: :created_by, primary_key: :id

    add_index :anonymous_evaluators, :updated_by
    add_foreign_key :anonymous_evaluators, :users, column: :updated_by, primary_key: :id

    add_index :mobility_calls, :created_by
    add_foreign_key :mobility_calls, :users, column: :created_by, primary_key: :id

    add_index :mobility_calls, :updated_by
    add_foreign_key :mobility_calls, :users, column: :updated_by, primary_key: :id
  end
end
