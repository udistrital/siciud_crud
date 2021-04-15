class DropTableResearchFocuses < ActiveRecord::Migration[5.2]
  def change
    drop_table :research_focuses
  end
end
