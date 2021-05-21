module Api
  module V1
    class ClinicalPracticeGuidelinesController < AbstractProductResearchUnitController
      include Swagger::ClinicalPracticeGuidelineApi

      before_action :set_research_group, only: [:index, :create]
      before_action :set_clinical_practice_guideline, only: [:show, :update]

      # GET /research_units/:id/clinical_practice_guidelines
      def index
        @clinical_practice_guidelines = CompleteClinicalPg.where(
          research_group_id: params[:research_group_id])
        @clinical_practice_guidelines = DxService.load(@clinical_practice_guidelines, params)

        render json: @clinical_practice_guidelines
      end

      # GET /clinical_practice_guidelines/1
      def show
        render json: @clinical_practice_guideline
      end

      # POST /research_units/:id/clinical_practice_guidelines
      def create
        @clinical_practice_guideline = @research_group.clinical_practice_guidelines.new(
          cpg_params_to_create)

        if @clinical_practice_guideline.save
          render json: @clinical_practice_guideline, status: :created
        else
          render json: @clinical_practice_guideline.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /clinical_practice_guidelines/1
      def update
        if @clinical_practice_guideline.update(cpg_params_to_update)
          render json: @clinical_practice_guideline
        else
          render json: @clinical_practice_guideline.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_clinical_practice_guideline
        @clinical_practice_guideline = ClinicalPracticeGuideline.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def cpg_params_to_create
        params.require(:clinical_practice_guideline).permit(:title, :date_of_publication, :isbn,
                                                            :geo_city_id, :geo_state_id, :geo_country_id,
                                                            :category_id, :research_group_id,
                                                            :colciencias_call_id, :observation, :active,
                                                            :created_by)
      end

      def cpg_params_to_update
        params.require(:clinical_practice_guideline).permit(:title, :date_of_publication, :isbn,
                                                            :geo_city_id, :geo_state_id, :geo_country_id,
                                                            :category_id, :research_group_id,
                                                            :colciencias_call_id, :observation, :active,
                                                            :updated_by)
      end
    end
  end
end