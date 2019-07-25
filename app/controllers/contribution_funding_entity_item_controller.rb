class ContributionFundingEntityItemController < ApplicationController
  before_action :set_agreement
  before_action :set_contribution
  before_action :set_contribution_funding_entity_item, only: [:show, :update, :destroy]

  before_action :set_research_group, only: [:show, :update, :attach]

  #Manejo de excepciones de la database
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { error: e.message }, status: :not_found
  end
  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def index
    @contribution_funding_entity_items = @contribution.contribution_funding_entity_items
    paginate json: @contribution_funding_entity_items
  end

  def show
    render json: @contribution_funding_entity_item
  end

  def create
    # byebug
    if (((@contribution.contribution_funding_entity_items.sum(:cashValue) + params[:contribution_funding_entity_item][:cashValue]) < @contribution.cashContribution) &&
        ((@contribution.contribution_funding_entity_items.sum(:inKindValue) + params[:contribution_funding_entity_item][:inKindValue]) < @contribution.cashContribution))
      @contribution_funding_entity_item = @contribution.contribution_funding_entity_items.new(contribution_funding_entity_item_params)
    else
      return render json: { "error": "No se puede asignar mas del presupuesto asignado" }, status: :unprocessable_entity
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
    @contribution_funding_entity_item = @contribution.contribution_funding_entity_items.find_by(id: params[:id])
  end

  def set_contribution
    @contribution = @agreement.contributions.find_by(id: params[:contribution_id])
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
