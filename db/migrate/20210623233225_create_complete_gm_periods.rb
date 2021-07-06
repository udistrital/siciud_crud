class CreateCompleteGmPeriods < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_gm_periods
  end
end
