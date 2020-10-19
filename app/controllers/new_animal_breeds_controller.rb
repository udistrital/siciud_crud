class NewAnimalBreedsController < ApplicationController
  before_action :set_new_animal_breed, only: [:show, :update, :destroy]

  # GET /new_animal_breeds
  def index
    @new_animal_breeds = NewAnimalBreed.all

    render json: @new_animal_breeds
  end

  # GET /new_animal_breeds/1
  def show
    render json: @new_animal_breed
  end

  # POST /new_animal_breeds
  def create
    @new_animal_breed = NewAnimalBreed.new(new_animal_breed_params)

    if @new_animal_breed.save
      render json: @new_animal_breed, status: :created, location: @new_animal_breed
    else
      render json: @new_animal_breed.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /new_animal_breeds/1
  def update
    if @new_animal_breed.update(new_animal_breed_params)
      render json: @new_animal_breed
    else
      render json: @new_animal_breed.errors, status: :unprocessable_entity
    end
  end

  # DELETE /new_animal_breeds/1
  def destroy
    @new_animal_breed.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_new_animal_breed
      @new_animal_breed = NewAnimalBreed.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def new_animal_breed_params
      params.require(:new_animal_breed).permit(:name, :date, :observation, :cycle_type_id, :petition_status_id, :category_id, :research_group_id)
    end
end
