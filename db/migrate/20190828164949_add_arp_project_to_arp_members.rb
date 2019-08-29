class AddArpProjectToArpMembers < ActiveRecord::Migration[5.2]
  def change
    add_reference :arp_members, :agreement_research_project, foreign_key: true
  end
end
