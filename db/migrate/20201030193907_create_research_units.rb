class CreateResearchUnits < ActiveRecord::Migration[5.2]
  def change
    create_view :research_units
  end
end
