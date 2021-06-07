class CreateInformativeBulletins < ActiveRecord::Migration[5.2]
  def change
    create_table :informative_bulletins do |t|
      t.string :title
      t.date :elaboration_date
      t.string :institution
      t.string :url
      t.references :geo_city, foreign_key: true
      t.references :geo_state, foreign_key: true
      t.references :geo_country, foreign_key: true
      t.bigint :category_id
      t.references :research_group, foreign_key: true
      t.references :colciencias_call, foreign_key: true
      t.text :observation
      t.boolean :active, default: true
      t.bigint :created_by
      t.bigint :updated_by

      t.timestamps
    end

    add_index :informative_bulletins, :category_id
    add_foreign_key :informative_bulletins, :subtypes, column: :category_id, primary_key: :id

    add_index :informative_bulletins, :created_by
    add_foreign_key :informative_bulletins, :users, column: :created_by, primary_key: :id

    add_index :informative_bulletins, :updated_by
    add_foreign_key :informative_bulletins, :users, column: :updated_by, primary_key: :id
  end
end
