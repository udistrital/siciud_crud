class CreateProposalProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :proposal_products do |t|
      t.string :name
      t.bigint :product_type_id
      t.references :indicator, foreign_key: true
      t.string :beneficiary
      t.references :proposal, foreign_key: true
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :proposal_products, :product_type_id
    add_foreign_key :proposal_products, :subtypes, column: :product_type_id, primary_key: :id

    add_index :proposal_products, :created_by
    add_foreign_key :proposal_products, :users, column: :created_by, primary_key: :id

    add_index :proposal_products, :updated_by
    add_foreign_key :proposal_products, :users, column: :updated_by, primary_key: :id
  end
end
