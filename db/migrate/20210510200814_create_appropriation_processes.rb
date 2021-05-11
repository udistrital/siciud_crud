class CreateAppropriationProcesses < ActiveRecord::Migration[5.2]
  def change
    create_table :appropriation_processes do |t|
      t.string :name
      t.string :research_project_title
      t.date :start_date
      t.date :finish_date
      t.string :funding_institution
      t.bigint :category_id
      t.bigint :product_type_id
      t.references :research_group, foreign_key: true
      t.references :colciencias_call, foreign_key: true
      t.text :observation
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :appropriation_processes, :category_id
    add_foreign_key :appropriation_processes, :subtypes, column: :category_id, primary_key: :id

    add_index :appropriation_processes, :product_type_id
    add_foreign_key :appropriation_processes, :subtypes, column: :product_type_id, primary_key: :id

    add_index :appropriation_processes, :created_by
    add_foreign_key :appropriation_processes, :users, column: :created_by, primary_key: :id

    add_index :appropriation_processes, :updated_by
    add_foreign_key :appropriation_processes, :users, column: :updated_by, primary_key: :id

  end
end
