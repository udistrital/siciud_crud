class VegetableVarietiesController < ApplicationController
  before_action :set_vegetable_variety, only: [:show, :update, :destroy]

  # GET /vegetable_varieties
  def index
    @vegetable_varieties = VegetableVariety.all

    render json: @vegetable_varieties
  end

  # GET /vegetable_varieties/1
  def show
    render json: @vegetable_variety
  end

  # POST /vegetable_varieties
  def create
    @vegetable_variety = VegetableVariety.new(vegetable_variety_params)

    if @vegetable_variety.save
      render json: @vegetable_variety, status: :created, location: @vegetable_variety
    else
      render json: @vegetable_variety.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vegetable_varieties/1
  def update
    if @vegetable_variety.update(vegetable_variety_params)
      render json: @vegetable_variety
    else
      render json: @vegetable_variety.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vegetable_varieties/1
  def destroy
    @vegetable_variety.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vegetable_variety
      @vegetable_variety = VegetableVariety.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vegetable_variety_params
      params.require(:vegetable_variety).permit(:name, :date, :observation, :cycle_type_id, :petition_status_id, :category_id, :research_group_id)
    end
end
