class Api::V1::ProductTypologiesController < ApplicationController
  before_action :set_product_typology, only: [:show, :update]


  def index
    @product_typologies = ProductTypology.all
    render json: @product_typologies
  end


  def show
    render json: @product_typologies
  end


  def create
    @product_typology = ProductTypology.new(product_typology_params)
    if @product_typology.save
      render json: @product_typology, status: :created
    else
      render json: @product_typology.errors, status: :unprocessable_entity
    end
  end


  def update
    if @product_typology.update(product_typology_params)
      render json: @product_typology
    else
      render json: @product_typology.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product_typology
    @product_typology = ProductTypology.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def product_typology_params
    params.require(:product_typology).permit(:name)
  end

end
