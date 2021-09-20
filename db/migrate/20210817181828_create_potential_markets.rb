class CreatePotentialMarkets < ActiveRecord::Migration[5.2]
  def change
    create_table :potential_markets do |t|
      t.bigint :market_participation_id
      t.integer :necesary_time
      t.boolean :product_dependency
      t.string :product_dependency_name
      t.boolean :institution_participation
      t.string :institution_participation_name
      t.string :stakeholder
      t.bigint :success_rank_id
      t.string :market_place
      t.references :procedure_request, foreign_key: true
      t.bigint :created_by
      t.bigint :updated_by
      t.boolean :active , default: true

      t.timestamps
    end

    add_index :potential_markets, :market_participation_id
    add_foreign_key :potential_markets, :subtypes, column: :market_participation_id, primary_key: :id

    add_index :potential_markets, :success_rank_id
    add_foreign_key :potential_markets, :subtypes, column: :success_rank_id, primary_key: :id

    add_index :potential_markets, :created_by
    add_foreign_key :potential_markets, :users, column: :created_by, primary_key: :id

    add_index :potential_markets, :updated_by
    add_foreign_key :potential_markets, :users, column: :updated_by, primary_key: :id
  end
end
