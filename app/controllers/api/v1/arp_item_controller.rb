class Api::V1::ArpItemController < ApplicationController
  before_action :set_agreement
  before_action :set_agreement_research_project, only: [:show, :update]

  def index
    #ItemCategory.find(params[:id]).contribution_funding_entity_items.joins(:contribution).where("contributions.agreement_id like '#{params[:agreement_id]}'")
    @items = ItemCategory.all.map do |category|
      category.contribution_funding_entity_items.joins(:contribution).where("contributions.agreement_id like '#{params[:agreement_id]}'")
    end

    render json: {"items": @items}
  end

  def show
    ItemCategory.find(params[:id]).contribution_funding_entity_items.joins(:contribution).where("contributions.agreement_id like '#{params[:agreement_id]}'")
  end

  private

  def set_agreement_research_project
    @agreement_research_project = @agreement.agreement_research_projects.find_by(id: params[:id])
    #@agreement_research_project = AgreementResearchProject.find(params[:id])
  end

  def agreement_research_project_params
    params.require(:agreement_research_project).permit(:code, :year, :startDate, :approbationDate, :estimatedFinishDate, :closingDate)
  end

  def set_agreement
    @agreement = Agreement.find(params[:agreement_id])
  end
end
