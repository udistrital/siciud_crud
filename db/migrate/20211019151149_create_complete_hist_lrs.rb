class CreateCompleteHistLrs < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_hist_lrs
  end
end
