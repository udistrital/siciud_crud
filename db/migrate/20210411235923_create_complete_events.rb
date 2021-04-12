class CreateCompleteEvents < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_events
  end
end
