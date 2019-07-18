class FundingEntityController < ApplicationController
  before_action :set_funding_entity, only: [:show, :update]
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { error: e.message }, status: :not_found
  end
  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def index
    #Listar todas las facultades
    @funding_entities = FundingEntity.all
    paginate json: @funding_entities
  end

  #Listar en detalle una facultad
  def show
    render json: @funding_entity
  end

  def create
    @funding_entity = FundingEntity.new(funding_entity_params)
    if @funding_entity.save
      render json: @funding_entity, status: :created
    else
      render json: @funding_entity.errors, status: :unprocessable_entity
    end
  end

  def update
    if @funding_entity.update(funding_entity)
      render json: @funding_entity
    else
      render json: @funding_entity.errors, status: :unprocessable_entity
    end
  end

  private

  def set_funding_entity
    @funding_entity = FundingEntity.find(params[:id])
  end

  def funding_entity_params
    params.require(:funding_entity).permit(:name,:country,:city,:phoneNumber,:mobileNumber)
  end
end
