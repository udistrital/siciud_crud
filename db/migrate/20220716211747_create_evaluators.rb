class CreateEvaluators < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluators do |t|
      t.string :name
      t.string :cvlac_url
      t.string :email
      t.string :mobile
      t.string :academic_title
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :evaluators, :created_by
    add_foreign_key :evaluators, :users, column: :created_by, primary_key: :id

    add_index :evaluators, :updated_by
    add_foreign_key :evaluators, :users, column: :updated_by, primary_key: :id

    change_column_default :keywords, :active, true

    add_index :keywords, :created_by
    add_foreign_key :keywords, :users, column: :created_by, primary_key: :id

    add_index :keywords, :updated_by
    add_foreign_key :keywords, :users, column: :updated_by, primary_key: :id
  end
end
