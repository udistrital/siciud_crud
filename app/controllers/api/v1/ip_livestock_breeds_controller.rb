module Api
  module V1
    class IpLivestockBreedsController < AbstractProductResearchUnitController
      include Swagger::IpLivestockBreedApi

      before_action :set_research_group
      before_action :set_ip_livestock_breed, only: [:show, :update, :change_active]
      before_action only: [:change_active] do
        active_in_body_params? ipl_breed_params_to_deactivate
      end

      # GET /research_group/:id/ip_livestock_breeds
      def index
        ipl_breeds = CompleteIplBreed.where(
          research_group_id: params[:research_group_id])
        @ip_livestock_breeds = DxService.load(ipl_breeds, params)
        render json: @ip_livestock_breeds
      end

      # GET /research_group/:id/ip_livestock_breeds/1
      def show
        render json: @ip_livestock_breed
      end

      # POST /research_group/:id/ip_livestock_breeds
      def create
        @ip_livestock_breed = @research_group.ip_livestock_breeds.new(
          ipl_breed_params_to_create)

        if @ip_livestock_breed.save
          render json: @ip_livestock_breed, status: :created
        else
          render json: @ip_livestock_breed.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_group/:id/ip_livestock_breeds/1
      def update
        if @ip_livestock_breed.update(ipl_breed_params_to_update)
          render json: @ip_livestock_breed
        else
          render json: @ip_livestock_breed.errors, status: :unprocessable_entity
        end
      end

      # PUT /research_group/:id/ip_livestock_breeds/1/active
      def change_active
        if @ip_livestock_breed.update(ipl_breed_params_to_deactivate)
          render json: @ip_livestock_breed
        else
          render json: @ip_livestock_breed.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_ip_livestock_breed
        @ip_livestock_breed = @research_group.ip_livestock_breeds.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def ipl_breed_params_to_create
        params.require(:ip_livestock_breed).permit(:name, :publication_date,
                                                   :consecutive_number_ma,
                                                   :observation, :category_id,
                                                   :colciencias_call_id,
                                                   :geo_city_id, :created_by)
      end

      def ipl_breed_params_to_update
        params.require(:ip_livestock_breed).permit(:name, :publication_date,
                                                   :consecutive_number_ma,
                                                   :observation, :category_id,
                                                   :colciencias_call_id,
                                                   :geo_city_id, :updated_by)
      end

      def ipl_breed_params_to_deactivate
        params.require(:ip_livestock_breed).permit(:active, :updated_by)
      end
    end
  end
end
