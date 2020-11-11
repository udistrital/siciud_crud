module Api
  module V1
    class VegetableVarietiesController < AbstractProductResearchUnitController
      before_action :set_research_group
      before_action :set_vegetable_variety, only: [:show, :update]

      # GET /research_group/:id/vegetable_varieties
      def index
        @vegetable_varieties = @research_group.vegetable_varieties

        render json: @vegetable_varieties
      end

      # GET /research_group/:id/vegetable_varieties/1
      def show
        render json: @vegetable_variety
      end

      # POST /research_group/:id/vegetable_varieties
      def create
        @vegetable_variety = @research_group.vegetable_varieties.new(vegetable_variety_params)

        if @vegetable_variety.save
          render json: @vegetable_variety, status: :created
        else
          render json: @vegetable_variety.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_group/:id/vegetable_varieties/1
      def update
        if @vegetable_variety.update(vegetable_variety_params)
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
      def vegetable_variety_params
        params.require(:vegetable_variety).permit(:name, :date, :observation,
                                                  :cycle_type_id, :petition_status_id,
                                                  :category_id, :geo_city_id)
      end
    end
  end
end