class CreateCompleteIndicators < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_indicators
  end
end
