class CreateCompleteRegulations < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_regulations
  end
end
