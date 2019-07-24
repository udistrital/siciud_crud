class ContributionFundingEntityItemController < ApplicationController
  before_action :set_agreement
  before_action :set_contribution
  before_action :set_contribution_funding_entity_item, only: [:show, :update, :destroy]

  def index
    @contribution_funding_entity_items = @contribution.contribution_funding_entity_items
    render json: @contribution_funding_entity_items
  end

  def show
    render json: @contribution_funding_entity_item
  end

  def create
   # byebug
    if((@contribution.contribution_funding_entity_items.sum(:cashValue)+params[:contribution_funding_entity_item][:cashValue])< @contribution.cashContribution)
    @contribution_funding_entity_item = @contribution.contribution_funding_entity_items.new(contribution_funding_entity_item_params)
    end
    if @contribution_funding_entity_item.save
      render json: @contribution, status: :created
    else
      render json: @contribution_funding_entity_item.errors, status: :unprocessable_entity
    end
  end

  def update
    if @contribution_funding_entity_item.update(contribution_funding_entity_item_params)
      render json: @contribution_funding_entity_item
    else
      render json: @contribution_funding_entity_item.errors, status: :unprocessable_entity
    end
  end

  private

  def set_contribution_funding_entity_item
    @contribution_funding_entity_item = @contribution.contribution_funding_entity_items.find_by(id:params[:id])
  end

  def set_contribution
    @contribution = @agreement.contributions.find_by(id:params[:contribution_id])
    #byebug
  end

  # Use callbacks to share common setup or constraints between actions.
  def contribution_funding_entity_item_params
    params.require(:contribution_funding_entity_item).permit(:inKindValue, :cashValue, :item_category_id)
  end

  def set_agreement
    @agreement = Agreement.find(params[:agreement_id])
  end
end
