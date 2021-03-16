module Api
  module V1
    class NewAnimalBreedsController < AbstractProductResearchUnitController
      include Swagger::NewAnimalBreedApi

      before_action :set_research_group
      before_action :set_new_animal_breed, only: [:show, :update, :change_active]
      before_action only: [:change_active] do
        active_in_body_params? nab_params_to_deactivate
      end

      # GET /research_group/:id/new_animal_breeds
      def index
        nabs = CompleteNewAnimalB.where(
          research_group_id: params[:research_group_id])
        @new_animal_breeds = DxService.load(nabs, params)
        render json: @new_animal_breeds
      end

      # GET /research_group/:id/new_animal_breeds/1
      def show
        render json: @new_animal_breed
      end

      # POST /research_group/:id/new_animal_breeds
      def create
        @new_animal_breed = @research_group.new_animal_breeds.new(
          nab_params_to_create)

        if @new_animal_breed.save
          render json: @new_animal_breed, status: :created
        else
          render json: @new_animal_breed.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_group/:id/new_animal_breeds/1
      def update
        if @new_animal_breed.update(nab_params_to_update)
          render json: @new_animal_breed
        else
          render json: @new_animal_breed.errors, status: :unprocessable_entity
        end
      end

      # PUT /research_group/:id/new_animal_breeds/1/active
      def change_active
        if @new_animal_breed.update(nab_params_to_deactivate)
          render json: @new_animal_breed
        else
          render json: @new_animal_breed.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_new_animal_breed
        @new_animal_breed = @research_group.new_animal_breeds.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def nab_params_to_create
        params.require(:new_animal_breed).permit(
          :name, :date, :observation, :cycle_type_id, :petition_status_id,
          :category_id, :colciencias_call_id, :geo_city_id, :created_by)
      end

      def nab_params_to_update
        params.require(:new_animal_breed).permit(
          :name, :date, :observation, :cycle_type_id, :petition_status_id,
          :category_id, :colciencias_call_id, :geo_city_id, :updated_by)
      end

      def nab_params_to_deactivate
        params.require(:new_animal_breed).permit(:active, :updated_by)
      end
    end
  end
end
