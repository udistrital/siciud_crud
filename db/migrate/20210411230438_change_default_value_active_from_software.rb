class ChangeDefaultValueActiveFromSoftware < ActiveRecord::Migration[5.2]
  def change
    change_column_default :software, :active, true
  end
end
