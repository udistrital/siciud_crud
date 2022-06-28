class CreateCompleteMobilityCallCriteria < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_mobility_call_criteria
  end
end
