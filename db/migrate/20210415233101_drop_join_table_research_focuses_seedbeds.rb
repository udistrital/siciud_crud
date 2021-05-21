class DropJoinTableResearchFocusesSeedbeds < ActiveRecord::Migration[5.2]
  def change
    drop_join_table :research_seedbeds, :research_focuses do |t|
      # t.index [:research_seedbed_id, :research_focus_id]
      # t.index [:research_focus_id, :research_seedbed_id]
    end
  end
end
