class CreateObjectives < ActiveRecord::Migration[5.2]
  def change
    create_table :objectives do |t|
      t.text :description
      t.bigint :parent_id
      t.references :proposal, foreign_key: true
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :objectives, :parent_id
    add_foreign_key :objectives, :objectives, column: :parent_id, primary_key: :id

    add_index :objectives, :created_by
    add_foreign_key :objectives, :users, column: :created_by, primary_key: :id

    add_index :objectives, :updated_by
    add_foreign_key :objectives, :users, column: :updated_by, primary_key: :id

  end
end
