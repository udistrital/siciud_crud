class CreateMemberSeedBeds < ActiveRecord::Migration[5.2]
  def change
    create_table :member_seed_beds do |t|
      t.date :initialDate
      t.date :finalDate
      t.references :role, foreign_key: true
      t.references :researcher, foreign_key: true
      t.reference :research_seedbed

      t.timestamps
    end
  end
end
