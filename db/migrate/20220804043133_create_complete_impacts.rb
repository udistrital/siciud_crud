class CreateCompleteImpacts < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_impacts
  end
end
