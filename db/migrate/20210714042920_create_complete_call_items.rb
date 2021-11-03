class CreateCompleteCallItems < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_call_items
  end
end
