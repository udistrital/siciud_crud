class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :eve_name
      t.date :eve_start_date
      t.date :eve_finish_date
      t.string :eve_organizers
      t.string :eve_entities
      t.bigint :category_id
      t.references :research_group, foreign_key: true
      t.references :colciencias_call, foreign_key: true
      t.text :eve_observation
      t.bigint :eve_type_id
      t.boolean :active, default: true 
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :events, :category_id
    add_foreign_key :events, :subtypes, column: :category_id, primary_key: :id

    add_index :events, :eve_type_id
    add_foreign_key :events, :subtypes, column: :eve_type_id, primary_key: :id

    add_index :events, :created_by
    add_foreign_key :events, :users, column: :created_by, primary_key: :id

    add_index :events, :updated_by
    add_foreign_key :events, :users, column: :updated_by, primary_key: :id

  end
end
