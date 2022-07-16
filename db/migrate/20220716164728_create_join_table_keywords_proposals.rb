class CreateJoinTableKeywordsProposals < ActiveRecord::Migration[5.2]
  def change
    create_join_table :keywords, :proposals do |t|
      # t.index [:keyword_id, :proposal_id]
      # t.index [:proposal_id, :keyword_id]
    end
  end
end
