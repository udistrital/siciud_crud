module Api
  module V1
    class RegulationsController < AbstractProductResearchUnitController
      include Swagger::RegulationApi

      before_action :set_research_group, only: [:index, :create]
      before_action :set_regulation, only: [:show, :update]

      # GET /research_units/:id/regulations
      def index
        if params[:product_type_id]
          @regulations = CompleteRegulation.where(
            "research_group_id = ? AND product_type_id = ?",
            params[:research_group_id], params[:product_type_id]
          )
        else
          @regulations = CompleteRegulation.where(
            research_group_id: params[:research_group_id])
        end
        @regulations = DxService.load(@regulations, params)

        render json: @regulations
      end

      # GET /regulations/1
      def show
        render json: @regulation
      end

      # POST /research_units/:id/regulations
      def create
        @regulation = @research_group.regulations.new(regulation_params_to_create)

        if @regulation.save
          render json: @regulation, status: :created
        else
          render json: @regulation.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /regulations/1
      def update
        if @regulation.update(regulation_params_to_update)
          render json: @regulation
        else
          render json: @regulation.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_regulation
        @regulation = Regulation.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def regulation_params_to_create
        params.require(:regulation).permit(:title, :date_of_publication, :issuing_entity,
                                           :regulation_type_id, :product_type_id, :geo_city_id,
                                           :geo_state_id, :geo_country_id,
                                           :category_id, :research_group_id, :colciencias_call_id,
                                           :observation, :active, :created_by)
      end

      def regulation_params_to_update
        params.require(:regulation).permit(:title, :date_of_publication, :issuing_entity,
                                           :regulation_type_id, :product_type_id, :geo_city_id,
                                           :geo_state_id, :geo_country_id,
                                           :category_id, :research_group_id, :colciencias_call_id,
                                           :observation, :active, :updated_by)
      end
    end
  end
end