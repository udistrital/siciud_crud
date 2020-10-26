class CreateIpLivestockBreeds < ActiveRecord::Migration[5.2]
  def change
    create_table :ip_livestock_breeds do |t|
      t.string :name
      t.date :publication_date
      t.string :consecutive_number_ma
      t.text :observation
      t.references :category, foreign_key: true
      t.references :research_group, foreign_key: true

      t.timestamps
    end
  end
end
