class AbstractProductResearchUnitController < ApplicationController

  def set_research_group
    @research_group = ResearchGroup.find(params[:research_group_id])
  end
end
