class CreateResultTransfers < ActiveRecord::Migration[5.2]
  def change
    create_table :result_transfers do |t|
      t.string :activity
      t.text :description
      t.text :goal
      t.references :Period, foreign_key: true

      t.timestamps
    end
  end
end
