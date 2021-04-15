class RemoveProductTypologyFromArpAssignments < ActiveRecord::Migration[5.2]
  def change
    remove_reference :arp_assignments, :product_typology, foreign_key: true
  end
end
