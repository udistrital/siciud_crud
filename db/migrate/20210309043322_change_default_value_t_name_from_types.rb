class ChangeDefaultValueTNameFromTypes < ActiveRecord::Migration[5.2]
  def change
    change_column_null :types, :t_name, false
  end
end
