class RemoveNameFromArpAssignment < ActiveRecord::Migration[5.2]
  def change
    remove_column :arp_assignments, :name, :string
  end
end
