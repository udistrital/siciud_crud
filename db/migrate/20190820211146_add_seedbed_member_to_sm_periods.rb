class AddSeedbedMemberToSmPeriods < ActiveRecord::Migration[5.2]
  def change
    add_reference :sm_periods, :seedbed_member, foreign_key: true
  end
end
