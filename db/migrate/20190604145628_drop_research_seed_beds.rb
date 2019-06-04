class DropResearchSeedBeds < ActiveRecord::Migration[5.2]
  def up
    drop_table :research_seed_beds
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
