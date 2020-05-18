class CreateContributionRpItems < ActiveRecord::Migration[5.2]
  def change
    create_table :contribution_rp_items do |t|
      t.float :cashValue
      t.float :inKindValue
      t.references :item_category, foreign_key: true
      t.references :contribution, foreign_key: true
      t.references :agreement_research_project, foreign_key: true

      t.timestamps
    end
  end
end
