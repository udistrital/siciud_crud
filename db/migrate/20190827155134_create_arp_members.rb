class CreateArpMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :arp_members do |t|
      t.references :arp_role, foreign_key: true
      t.references :agreement, foreign_key: true
      t.references :group_member, foreign_key: true

      t.timestamps
    end
  end
end
