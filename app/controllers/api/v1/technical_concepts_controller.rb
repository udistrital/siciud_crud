module Api
  module V1
    class TechnicalConceptsController < AbstractProductResearchUnitController
      include Swagger::TechnicalConceptApi

      before_action :set_research_group, only: [:index, :create]
      before_action :set_technical_concept, only: [:show, :update]

      # GET /research_units/:id/technical_concepts
      def index
        @technical_concepts = CompleteTechnicalConcept.where(
          research_group_id: params[:research_group_id])
        @technical_concepts = DxService.load(@technical_concepts, params)

        render json: @technical_concepts
      end

      # GET /technical_concepts/1
      def show
        render json: @technical_concept
      end

      # POST /research_units/:id/technical_concepts
      def create
        @technical_concept = @research_group.technical_concepts.new(tc_params_to_create)

        if @technical_concept.save
          render json: @technical_concept, status: :created
        else
          render json: @technical_concept.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /technical_concepts/1
      def update
        if @technical_concept.update(tc_params_to_update)
          render json: @technical_concept
        else
          render json: @technical_concept.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_technical_concept
        @technical_concept = TechnicalConcept.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def tc_params_to_create
        params.require(:technical_concept).permit(:title, :request_date, :consecutive_number,
                                                  :send_date, :requesting_institution_name,
                                                  :geo_city_id, :geo_state_id, :geo_country_id,
                                                  :category_id, :research_group_id,
                                                  :colciencias_call_id, :observation,
                                                  :active, :created_by)
      end

      def tc_params_to_update
        params.require(:technical_concept).permit(:title, :request_date, :consecutive_number,
                                                  :send_date, :requesting_institution_name,
                                                  :geo_city_id, :geo_state_id, :geo_country_id,
                                                  :category_id, :research_group_id,
                                                  :colciencias_call_id, :observation,
                                                  :active, :updated_by)
      end
    end
  end
end
