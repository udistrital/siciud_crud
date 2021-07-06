class AddIsCurrentToGmPeriods < ActiveRecord::Migration[5.2]
  def change
    add_column :gm_periods, :is_current, :boolean, default: true
  end
end
