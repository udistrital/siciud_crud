class UpdateCompleteIndustrialDesignsToVersion3 < ActiveRecord::Migration[5.2]
  def change
    update_view :complete_industrial_designs, version: 3, revert_to_version: 2
  end
end
