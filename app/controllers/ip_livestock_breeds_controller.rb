class IpLivestockBreedsController < ApplicationController
  before_action :set_ip_livestock_breed, only: [:show, :update, :destroy]

  # GET /ip_livestock_breeds
  def index
    @ip_livestock_breeds = IpLivestockBreed.all

    render json: @ip_livestock_breeds
  end

  # GET /ip_livestock_breeds/1
  def show
    render json: @ip_livestock_breed
  end

  # POST /ip_livestock_breeds
  def create
    @ip_livestock_breed = IpLivestockBreed.new(ip_livestock_breed_params)

    if @ip_livestock_breed.save
      render json: @ip_livestock_breed, status: :created, location: @ip_livestock_breed
    else
      render json: @ip_livestock_breed.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ip_livestock_breeds/1
  def update
    if @ip_livestock_breed.update(ip_livestock_breed_params)
      render json: @ip_livestock_breed
    else
      render json: @ip_livestock_breed.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ip_livestock_breeds/1
  def destroy
    @ip_livestock_breed.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ip_livestock_breed
      @ip_livestock_breed = IpLivestockBreed.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def ip_livestock_breed_params
      params.require(:ip_livestock_breed).permit(:name, :publication_date, :consecutive_number_ma, :observation, :category_id, :research_group_id)
    end
end
