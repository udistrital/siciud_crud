class CreateGroupMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :group_members do |t|
      t.references :role, foreign_key: true
      t.references :researcher, foreign_key: true
      t.references :research_group, foreign_key: true
      t.references :state_reseacher, foreign_key: true

      t.timestamps
    end
  end
end
