module Api
  module V1
    class DistinctiveSignsController < AbstractProductResearchUnitController
      include Swagger::DistinctiveSignApi

      before_action :set_research_group, only: [:index, :create]
      before_action :set_distinctive_sign, only: [:show, :update]

      # GET /research_units/:id/distinctive_signs
      def index
        @distinctive_signs = CompleteDistinctiveSign.where(
          research_group_id: params[:research_group_id])
        @distinctive_signs = DxService.load(@distinctive_signs, params)

        render json: @distinctive_signs
      end

      # GET /distinctive_signs/1
      def show
        render json: @distinctive_sign
      end

      # POST /research_units/:id/distinctive_signs
      def create
        @distinctive_sign = @research_group.distinctive_signs.new(dist_sign_params_to_create)

        if @distinctive_sign.save
          render json: @distinctive_sign, status: :created
        else
          render json: @distinctive_sign.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /distinctive_signs/1
      def update
        if @distinctive_sign.update(dist_sign_params_to_update)
          render json: @distinctive_sign
        else
          render json: @distinctive_sign.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_distinctive_sign
        @distinctive_sign = DistinctiveSign.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def dist_sign_params_to_create
        params.require(:distinctive_sign).permit(:registration_title, :registration_number,
                                                 :date_of_obtaining, :geo_city_id, :geo_state_id,
                                                 :geo_country_id, :category_id,
                                                 :research_group_id, :colciencias_call_id,
                                                 :observation, :active, :created_by)
      end

      def dist_sign_params_to_update
        params.require(:distinctive_sign).permit(:registration_title, :registration_number,
                                                 :date_of_obtaining, :geo_city_id, :geo_state_id,
                                                 :geo_country_id, :category_id,
                                                 :research_group_id, :colciencias_call_id,
                                                 :observation, :active, :updated_by)
      end
    end
  end
end