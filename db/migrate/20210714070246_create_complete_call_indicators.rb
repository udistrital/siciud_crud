class CreateCompleteCallIndicators < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_call_indicators
  end
end
