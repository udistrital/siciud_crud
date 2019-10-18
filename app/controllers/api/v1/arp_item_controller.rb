class Api::V1::ArpItemController < ApplicationController
  before_action :set_agreement
  before_action :set_agreement_research_project, only: [:show, :update]

  def index
    #ItemCategory.find(params[:id]).contribution_funding_entity_items.joins(:contribution).where("contributions.agreement_id like '#{params[:agreement_id]}'")
    @items = ItemCategory.all.map do |category|
      item = category.contribution_funding_entity_items.joins(:contribution).where("contributions.agreement_id like '#{params[:agreement_id]}'")
      {
        cashValue: item.sum(:cashValue),
        inKindValue: item.sum(:inKindValue),
        remainingCash: item.sum(:cashValue) - item.map do |contribution_funding_entity_item|
          contribution_funding_entity_item.contribution_rp_items.sum(:compromisedCash)
        end.sum - item.map do |contribution_funding_entity_item|
          contribution_funding_entity_item.contribution_rp_items.sum(:executedCash)
        end.sum,
        remainingInKind: item.map do |contribution_funding_entity_item|
          contribution_funding_entity_item.contribution_rp_items.sum(:remainingInKind)
        end.sum,
        compromisedCash: item.map do |contribution_funding_entity_item|
          contribution_funding_entity_item.contribution_rp_items.sum(:compromisedCash)
        end.sum,
        compromisedInKind: item.map do |contribution_funding_entity_item|
          contribution_funding_entity_item.contribution_rp_items.sum(:compromisedInKind)
        end.sum,
        executedCash: item.map do |contribution_funding_entity_item|
          contribution_funding_entity_item.contribution_rp_items.sum(:executedCash)
        end.sum,
        executedInKind: item.map do |contribution_funding_entity_item|
          contribution_funding_entity_item.contribution_rp_items.sum(:executedInKind)
        end.sum,
        item_category_id: category.id
      }
    end
    #byebug
    render json:  @items
  end

  def show
    @contribution_rp_items = ItemCategory.find(params[:id]).contribution_funding_entity_items.joins(:contribution).where("contributions.agreement_id like '#{params[:agreement_id]}'").map do |contribution_funding_entity_item|
      contribution_funding_entity_item.contribution_rp_items
    end.delete_if(&:blank?)
    render json: @contribution_rp_items.flatten,                  each_serializer: nil

    #@items = ItemCategory.all.map do |category|
    # {
    #  cashValue: category.contribution_funding_entity_items.joins(:contribution).where("contributions.agreement_id like '#{params[:agreement_id]}'").sum(:cashValue),
    # inKindValue: category.contribution_funding_entity_items.joins(:contribution).where("contributions.agreement_id like '#{params[:agreement_id]}'").sum(:inKindValue),
    #item_category_id: category.id,
    #}
    #end
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
