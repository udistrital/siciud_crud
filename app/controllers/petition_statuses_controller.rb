class PetitionStatusesController < ApplicationController
  before_action :set_petition_status, only: [:show, :update, :destroy]

  # GET /petition_statuses
  def index
    @petition_statuses = PetitionStatus.all

    render json: @petition_statuses
  end

  # GET /petition_statuses/1
  def show
    render json: @petition_status
  end

  # POST /petition_statuses
  def create
    @petition_status = PetitionStatus.new(petition_status_params)

    if @petition_status.save
      render json: @petition_status, status: :created, location: @petition_status
    else
      render json: @petition_status.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /petition_statuses/1
  def update
    if @petition_status.update(petition_status_params)
      render json: @petition_status
    else
      render json: @petition_status.errors, status: :unprocessable_entity
    end
  end

  # DELETE /petition_statuses/1
  def destroy
    @petition_status.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_petition_status
      @petition_status = PetitionStatus.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def petition_status_params
      params.require(:petition_status).permit(:name)
    end
end
