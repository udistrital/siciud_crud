class AddAvailabilityNumberToAgreeements < ActiveRecord::Migration[5.2]
  def change
    add_column :agreements, :availability, :integer
  end
end
