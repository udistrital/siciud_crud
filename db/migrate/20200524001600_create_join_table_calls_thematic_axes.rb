class CreateJoinTableCallsThematicAxes < ActiveRecord::Migration[5.2]
  def change
    create_join_table :calls, :thematic_axes do |t|
      # t.index [:call_id, :thematic_axis_id]
      # t.index [:thematic_axis_id, :call_id]
    end
  end
end
