module Api
  module V1
    class VegetableVarietiesController < AbstractProductResearchUnitController
      include Swagger::VegetableVarietyApi

      before_action :set_research_group
      before_action :set_vegetable_variety, only: [:show, :update, :change_active]
      before_action only: [:change_active] do
        active_in_body_params? vv_params_to_deactivate
      end

      # GET /research_group/:id/vegetable_varieties
      def index
        v_varieties = CompleteVegetableVariety.where(
          research_group_id: params[:research_group_id])
        @vegetable_varieties = DxService.load(v_varieties, params)
        render json: @vegetable_varieties
      end

      # GET /research_group/:id/vegetable_varieties/1
      def show
        render json: @vegetable_variety
      end

      # POST /research_group/:id/vegetable_varieties
      def create
        @vegetable_variety = @research_group.vegetable_varieties.new(
          vv_params_to_create)

        if @vegetable_variety.save
          render json: @vegetable_variety, status: :created
        else
          render json: @vegetable_variety.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_group/:id/vegetable_varieties/1
      def update
        if @vegetable_variety.update(vv_params_to_update)
          render json: @vegetable_variety
        else
          render json: @vegetable_variety.errors, status: :unprocessable_entity
        end
      end

      # PUT /research_group/:id/vegetable_varieties/1/active
      def change_active
        if @vegetable_variety.update(vv_params_to_deactivate)
          render json: @vegetable_variety
        else
          render json: @vegetable_variety.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_vegetable_variety
        @vegetable_variety = @research_group.vegetable_varieties.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def vv_params_to_create
        params.require(:vegetable_variety).permit(
          :name, :date, :observation,
          :cycle_type_id, :petition_status_id,
          :category_id, :colciencias_call_id,
          :geo_city_id, :created_by)
      end

      def vv_params_to_update
        params.require(:vegetable_variety).permit(
          :name, :date, :observation,
          :cycle_type_id, :petition_status_id,
          :category_id, :colciencias_call_id,
          :geo_city_id, :updated_by)
      end

      def vv_params_to_deactivate
        params.require(:vegetable_variety).permit(:active, :updated_by)
      end
    end
  end
end