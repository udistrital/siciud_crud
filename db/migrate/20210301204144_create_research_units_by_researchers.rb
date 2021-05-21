class CreateResearchUnitsByResearchers < ActiveRecord::Migration[5.2]
  def change
    create_view :research_units_by_researchers
  end
end
