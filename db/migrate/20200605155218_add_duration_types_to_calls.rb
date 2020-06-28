class AddDurationTypesToCalls < ActiveRecord::Migration[5.2]
  def change
    add_reference :calls, :duration_type, foreign_key: true
  end
end
