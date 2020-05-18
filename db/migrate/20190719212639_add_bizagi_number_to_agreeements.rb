class AddBizagiNumberToAgreeements < ActiveRecord::Migration[5.2]
  def change
    add_column :agreements, :bizagiNumber, :integer
  end
end
