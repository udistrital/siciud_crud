class AddResearcherToMobilityCalls < ActiveRecord::Migration[5.2]
  def change
    add_reference :mobility_calls, :researcher, foreign_key: true
  end
end
