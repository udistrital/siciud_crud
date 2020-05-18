class CreateSeedbedMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :seedbed_members do |t|
      t.references :role, foreign_key: true
      t.references :researcher, foreign_key: true
      t.references :research_seedbed, foreign_key: true
      t.references :state_reseacher, foreign_key: true

      t.timestamps
    end
  end
end
