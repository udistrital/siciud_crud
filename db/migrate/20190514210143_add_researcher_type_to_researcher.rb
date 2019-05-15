class AddResearcherTypeToResearcher < ActiveRecord::Migration[5.2]
  def change
    add_reference :researchers, :researcher_type, foreign_key: true
  end
end
