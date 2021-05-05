module Api
  module V1
    class InnovationsController < AbstractProductResearchUnitController
      include Swagger::InnovationApi

      before_action :set_research_group, only: [:index, :create]
      before_action :set_innovation, only: [:show, :update]

      # GET /research_units/:id/innovations
      def index
        @innovations = CompleteInnovation.where(
          research_group_id: params[:research_group_id])
        @innovations = DxService.load(@innovations, params)

        render json: @innovations
      end

      # GET /innovations/1
      def show
        render json: @innovation
      end

      # POST /research_units/:id/innovations
      def create
        @innovation = @research_group.innovations.new(innovation_params_to_create)

        if @innovation.save
          render json: @innovation, status: :created
        else
          render json: @innovation.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /innovations/1
      def update
        if @innovation.update(innovation_params_to_update)
          render json: @innovation
        else
          render json: @innovation.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_innovation
        @innovation = Innovation.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def innovation_params_to_create
        params.require(:innovation).permit(:name, :nit, :company_name,
                                           :date_of_obtaining,
                                           :product_type_id, :geo_city_id,
                                           :category_id, :research_group_id,
                                           :colciencias_call_id, :observation,
                                           :active, :created_by)
      end

      def innovation_params_to_update
        params.require(:innovation).permit(:name, :nit, :company_name,
                                           :date_of_obtaining,
                                           :product_type_id, :geo_city_id,
                                           :category_id, :research_group_id,
                                           :colciencias_call_id, :observation,
                                           :active, :updated_by)
      end
    end
  end
end