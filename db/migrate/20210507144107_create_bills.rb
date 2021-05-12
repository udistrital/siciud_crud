class CreateBills < ActiveRecord::Migration[5.2]
  def change
    create_table :bills do |t|
      t.string :title
      t.bigint :category_id
      t.references :research_group, foreign_key: true
      t.references :colciencias_call, foreign_key: true
      t.text :observation
      t.boolean :active
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :bills, :category_id
    add_foreign_key :bills, :subtypes, column: :category_id, primary_key: :id

    add_index :bills, :created_by
    add_foreign_key :bills, :users, column: :created_by, primary_key: :id

    add_index :bills, :updated_by
    add_foreign_key :bills, :users, column: :updated_by, primary_key: :id

  end
end
