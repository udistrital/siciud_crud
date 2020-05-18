class AddDurationToAgreeements < ActiveRecord::Migration[5.2]
  def change
    add_column :agreements, :duration, :integer
  end
end
