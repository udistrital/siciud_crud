module Api
  module V1
    class NewAnimalBreedsController < AbstractProductResearchUnitController
      before_action only: [:create] do
        validate_created_by(new_animal_breed_params)
      end
      before_action only: [:create, :update] do
        validate_updated_by(new_animal_breed_params)
      end
      before_action :set_research_group
      before_action :set_new_animal_breed, only: [:show, :update]

      # GET /research_group/:id/new_animal_breeds
      def index
        @new_animal_breeds = DxService.load(CompleteNewAnimalB, params)
        render json: @new_animal_breeds
      end

      # GET /research_group/:id/new_animal_breeds/1
      def show
        render json: @new_animal_breed
      end

      # POST /research_group/:id/new_animal_breeds
      def create
        @new_animal_breed = @research_group.new_animal_breeds.new(
            new_animal_breed_params.except(:created_by, :updated_by))

        # Add user in created_by and updated_by
        @new_animal_breed.created_by = @created_by_user
        @new_animal_breed.updated_by = @updated_by_user

        if @new_animal_breed.save
          render json: @new_animal_breed, status: :created
        else
          render json: @new_animal_breed.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_group/:id/new_animal_breeds/1
      def update
        # Update user of updated_by
        @new_animal_breed.updated_by = @updated_by_user

        if @new_animal_breed.update(new_animal_breed_params.except(:created_by,
                                                                   :updated_by))
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
      def new_animal_breed_params
        params.require(:new_animal_breed).permit(:name, :date, :observation,
                                                 :cycle_type_id, :petition_status_id,
                                                 :category_id, :geo_city_id, :active,
                                                 :created_by, :updated_by)
      end
    end
  end
end
