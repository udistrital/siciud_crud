class CreateGmPeriods < ActiveRecord::Migration[5.2]
  def change
    create_table :gm_periods do |t|
      t.date :initialDate
      t.date :finalDate
      t.references :role, foreign_key: true
      t.references :group_member, foreign_key: true

      t.timestamps
    end
  end
end
