class CreateCompleteIndustrialDesigns < ActiveRecord::Migration[5.2]
  def change
    create_view :complete_industrial_designs
  end
end
