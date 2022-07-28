class CreateRisks < ActiveRecord::Migration[5.2]
  def change
    create_table :risks do |t|
      t.string :name
      t.text :consequence
      t.text :mitigation
      t.references :proposal, foreign_key: true
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :risks, :created_by
    add_foreign_key :risks, :users, column: :created_by, primary_key: :id

    add_index :risks, :updated_by
    add_foreign_key :risks, :users, column: :updated_by, primary_key: :id

  end
end
