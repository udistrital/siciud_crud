class AddOrcidIdToResearcher < ActiveRecord::Migration[5.2]
  def change
    add_column :researchers, :orcid_id, :string
  end
end
