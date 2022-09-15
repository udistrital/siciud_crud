class CreateCompleteItemDetails < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_item_details
  end
end
