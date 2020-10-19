class CycleTypesController < ApplicationController
  before_action :set_cycle_type, only: [:show, :update, :destroy]

  # GET /cycle_types
  def index
    @cycle_types = CycleType.all

    render json: @cycle_types
  end

  # GET /cycle_types/1
  def show
    render json: @cycle_type
  end

  # POST /cycle_types
  def create
    @cycle_type = CycleType.new(cycle_type_params)

    if @cycle_type.save
      render json: @cycle_type, status: :created, location: @cycle_type
    else
      render json: @cycle_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cycle_types/1
  def update
    if @cycle_type.update(cycle_type_params)
      render json: @cycle_type
    else
      render json: @cycle_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cycle_types/1
  def destroy
    @cycle_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cycle_type
      @cycle_type = CycleType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cycle_type_params
      params.require(:cycle_type).permit(:name)
    end
end
