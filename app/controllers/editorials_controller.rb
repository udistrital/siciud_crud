class EditorialsController < ApplicationController
  before_action :set_editorial, only: [:show, :update, :destroy]

  # GET /editorials
  def index
    @editorials = Editorial.all

    render json: @editorials
  end

  # GET /editorials/1
  def show
    render json: @editorial
  end

  # POST /editorials
  def create
    @editorial = Editorial.new(editorial_params)

    if @editorial.save
      render json: @editorial, status: :created, location: @editorial
    else
      render json: @editorial.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /editorials/1
  def update
    if @editorial.update(editorial_params)
      render json: @editorial
    else
      render json: @editorial.errors, status: :unprocessable_entity
    end
  end

  # DELETE /editorials/1
  def destroy
    @editorial.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_editorial
      @editorial = Editorial.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def editorial_params
      params.require(:editorial).permit(:name)
    end
end
