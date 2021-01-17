module Api
  module V1
    class IpLivestockBreedsController < AbstractProductResearchUnitController
      include Swagger::IpLivestockBreedApi

      before_action :set_research_group, only: [:index, :show, :create, :update]
      before_action :set_ip_livestock_breed, only: [:show, :update]

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
            ip_livestock_breed_params)

        if @ip_livestock_breed.save
          render json: @ip_livestock_breed, status: :created
        else
          render json: @ip_livestock_breed.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_group/:id/ip_livestock_breeds/1
      def update
        if @ip_livestock_breed.created_by.nil?
          # Update user of created_by only this is nil
          if @ip_livestock_breed.update(ip_livestock_breed_params)
            render json: @ip_livestock_breed
          else
            render json: @ip_livestock_breed.errors, status: :unprocessable_entity
          end
        else
          if @ip_livestock_breed.update(ip_livestock_breed_params.except(
              :created_by))
            render json: @ip_livestock_breed
          else
            render json: @ip_livestock_breed.errors, status: :unprocessable_entity
          end
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_ip_livestock_breed
        @ip_livestock_breed = @research_group.ip_livestock_breeds.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def ip_livestock_breed_params
        params.require(:ip_livestock_breed).permit(:name, :publication_date,
                                                   :consecutive_number_ma,
                                                   :observation, :category_id,
                                                   :geo_city_id, :certificate_ma_document,
                                                   :ip_livestock_breed_document, :active,
                                                   :created_by, :updated_by)
      end
    end
  end
end
