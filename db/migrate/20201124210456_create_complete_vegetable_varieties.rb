class CreateCompleteVegetableVarieties < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_vegetable_varieties
  end
end
