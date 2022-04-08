class CreateMobilityCalls < ActiveRecord::Migration[5.2]
  def change
    create_table :mobility_calls do |t|
      t.references :call, foreign_key: true
      t.references :geo_city, foreign_key: true
      t.references :geo_country, foreign_key: true
      t.references :geo_state, foreign_key: true
      t.string :event_name
      t.integer :event_edition_number
      t.date :event_date
      t.string :paper_name
      t.boolean :is_organizer
      t.string :event_page
      t.references :research_group, foreign_key: true
      t.boolean :active
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end
  end
end
