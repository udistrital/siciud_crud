class CreateMemberSeedbeds < ActiveRecord::Migration[5.2]
  def change
    create_table :member_seedbeds do |t|
      t.date :initialDate
      t.date :finalDate
      t.references :role, foreign_key: true
      t.references :researcher, foreign_key: true
      t.references :research_seedbed, foreign_key: true
      t.references :state_reseacher, foreign_key: true
      t.references :researcher_type, foreign_key: true

      t.timestamps
    end
  end
end
