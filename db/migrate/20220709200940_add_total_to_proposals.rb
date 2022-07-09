class AddTotalToProposals < ActiveRecord::Migration[5.2]
  def change
    add_column :proposals, :total_amount_request_cidc, :float
    add_column :proposals, :total_counterparty, :float
    add_column :proposals, :total_amount_in_kind, :float

    remove_foreign_key :proposals, :geo_cities
    remove_index :proposals, :geo_city_id
    remove_column :proposals, :geo_city_id, :bigint

    remove_foreign_key :proposals, :geo_countries
    remove_index :proposals, :geo_country_id
    remove_column :proposals, :geo_country_id, :bigint

    remove_foreign_key :proposals, :geo_states
    remove_index :proposals, :geo_state_id
    remove_column :proposals, :geo_state_id, :bigint
  end
end
