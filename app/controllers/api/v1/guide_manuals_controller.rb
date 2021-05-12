module Api
  module V1
    class GuideManualsController < AbstractProductResearchUnitController
      include Swagger::GuideManualApi

      before_action :set_research_group, only: [:index, :create]
      before_action :set_guide_manual, only: [:show, :update]

      # GET /research_units/:id/guide_manuals
      def index
        if params[:product_type_id]
          @guide_manuals = CompleteGuideManual.where(
            "research_group_id = ? AND product_type_id = ?",
            params[:research_group_id], params[:product_type_id]
          )
        else
          @guide_manuals = CompleteGuideManual.where(
            research_group_id: params[:research_group_id])
        end
        @guide_manuals = DxService.load(@guide_manuals, params)

        render json: @guide_manuals
      end

      # GET /guide_manuals/1
      def show
        render json: @guide_manual
      end

      # POST /research_units/:id/guide_manuals
      def create
        @guide_manual = @research_group.guide_manuals.new(
          guide_manual_params_to_create)

        if @guide_manual.save
          render json: @guide_manual, status: :created
        else
          render json: @guide_manual.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /guide_manuals/1
      def update
        if @guide_manual.update(guide_manual_params_to_update)
          render json: @guide_manual
        else
          render json: @guide_manual.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_guide_manual
        @guide_manual = GuideManual.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def guide_manual_params_to_create
        params.require(:guide_manual).permit(:title, :date_of_publication, :url, :product_type_id,
                                             :geo_city_id, :category_id,
                                             :colciencias_call_id, :observation,
                                             :active, :created_by)
      end

      def guide_manual_params_to_update
        params.require(:guide_manual).permit(:title, :date_of_publication, :url, :product_type_id,
                                             :geo_city_id, :category_id, :research_group_id,
                                             :colciencias_call_id, :observation,
                                             :active, :updated_by)
      end
    end
  end
end