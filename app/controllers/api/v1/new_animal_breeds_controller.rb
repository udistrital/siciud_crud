module Api
  module V1
    class NewAnimalBreedsController < AbstractProductResearchUnitController
      before_action :set_research_group
      before_action :set_new_animal_breed, only: [:show, :update, :attach]

      # GET /research_group/:id/new_animal_breeds
      def index
        @new_animal_breeds = @research_group.new_animal_breeds
        render json: @new_animal_breeds
      end

      # GET /research_group/:id/new_animal_breeds/1
      def show
        render json: @new_animal_breed
      end

      # POST /research_group/:id/new_animal_breeds
      def create
        @new_animal_breed = @research_group.new_animal_breeds.new(new_animal_breed_params)
        if @new_animal_breed.save
          render json: @new_animal_breed, status: :created
        else
          render json: @new_animal_breed.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_group/:id/new_animal_breeds/1
      def update
        if @new_animal_breed.update(new_animal_breed_params)
          render json: @new_animal_breed
        else
          render json: @new_animal_breed.errors, status: :unprocessable_entity
        end
      end

      # PUT /research_group/:id/new_animal_breeds/1/attach
      def attach
        params.permit(:book_document)
        if (file = params[:book_document])
          if file.content_type == "application/pdf"
            @new_animal_breed.book_document.attach(file)
          else
            return render json: {'error': 'El libro debe ser formato pdf.'},
                          status: :unprocessable_entity
          end
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
                                                 :category_id, :geo_city_id)
      end
    end
  end
end
