class RemoveFieldsFromSmPeriods < ActiveRecord::Migration[5.2]
  def change
    remove_reference :sm_periods, :seedbeed_member, foreign_key: true
  end
end
