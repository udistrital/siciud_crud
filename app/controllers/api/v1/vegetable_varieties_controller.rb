module Api
  module V1
    class VegetableVarietiesController < AbstractProductResearchUnitController
      before_action :set_research_group
      before_action :set_vegetable_variety, only: [:show, :update]

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
            vegetable_variety_params)

        if @vegetable_variety.save
          render json: @vegetable_variety, status: :created
        else
          render json: @vegetable_variety.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_group/:id/vegetable_varieties/1
      def update
        if @vegetable_variety.created_by.nil?
          # Update user of created_by only this is nil
          if @vegetable_variety.update(vegetable_variety_params)
            render json: @vegetable_variety
          else
            render json: @vegetable_variety.errors, status: :unprocessable_entity
          end
        else
          if @vegetable_variety.update(vegetable_variety_params.except(:created_by))
            render json: @vegetable_variety
          else
            render json: @vegetable_variety.errors, status: :unprocessable_entity
          end
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
                                                  :vegetable_variety_document,
                                                  :category_id, :geo_city_id, :active,
                                                  :created_by, :updated_by)
      end
    end
  end
end