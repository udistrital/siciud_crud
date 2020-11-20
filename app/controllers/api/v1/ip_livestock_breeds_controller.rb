module Api
  module V1
    class IpLivestockBreedsController < AbstractProductResearchUnitController
      before_action only: [:create] do
        validate_created_by(ip_livestock_breed_params)
      end
      before_action only: [:create, :update] do
        validate_updated_by(ip_livestock_breed_params)
      end
      before_action :set_research_group, only: [:index, :show, :create, :update]
      before_action :set_ip_livestock_breed, only: [:show, :update]

      # GET /research_group/:id/ip_livestock_breeds
      def index
        @ip_livestock_breeds = DxService.load(CompleteIplBreed, params)
        render json: @ip_livestock_breeds
      end

      # GET /research_group/:id/ip_livestock_breeds/1
      def show
        render json: @ip_livestock_breed
      end

      # POST /research_group/:id/ip_livestock_breeds
      def create
        @ip_livestock_breed = @research_group.ip_livestock_breeds.new(
            ip_livestock_breed_params.except(:created_by, :updated_by)
        )

        # Add user in created_by and updated_by
        @ip_livestock_breed.created_by = @created_by_user
        @ip_livestock_breed.updated_by = @updated_by_user

        if @ip_livestock_breed.save
          render json: @ip_livestock_breed, status: :created
        else
          render json: @ip_livestock_breed.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_group/:id/ip_livestock_breeds/1
      def update
        # Update user of updated_by
        @ip_livestock_breed.updated_by = @updated_by_user
        if @ip_livestock_breed.update(ip_livestock_breed_params.except(
            :created_by, :updated_by)
        )
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
