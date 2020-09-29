class RenameFieldFromGmPeriods < ActiveRecord::Migration[5.2]
  def change
    rename_column :gm_periods, :initialDate, :initial_date
    rename_column :gm_periods, :finalDate, :final_date
  end
end
