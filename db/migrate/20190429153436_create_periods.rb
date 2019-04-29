class CreatePeriods < ActiveRecord::Migration[5.2]
  def change
    create_table :periods do |t|
      t.date :initialDate
      t.date :finalDate
      t.references :role, foreign_key: true
      t.references :researcher, foreign_key: true
      t.references :research_group, foreign_key: true

      t.timestamps
    end
  end
end
