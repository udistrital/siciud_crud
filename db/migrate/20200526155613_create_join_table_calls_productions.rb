class CreateJoinTableCallsProductions < ActiveRecord::Migration[5.2]
  def change
    create_join_table :calls, :productions do |t|
      # t.index [:call_id, :production_id]
      # t.index [:production_id, :call_id]
    end
  end
end
