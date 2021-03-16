module Api
  module V1
    class PatentsController < AbstractProductResearchUnitController
      include Swagger::PatentApi

      before_action :set_research_group
      before_action :set_patent, only: [:show, :update, :change_active]
      before_action only: [:change_active] do
        active_in_body_params? patent_params_to_deactivate
      end

      # GET /research_group/:id/patents
      def index
        list_patents = CompletePatent.where(
          research_group_id: params[:research_group_id])
        @patents = DxService.load(list_patents, params)
        render json: @patents
      end

      # GET /research_group/:id/patents/1
      def show
        render json: @patent
      end

      # POST /research_group/:id/patents
      def create
        @patent = @research_group.patents.new(patent_params_to_create)

        if @patent.save
          render json: @patent, status: :created
        else
          render json: @patent.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_group/:id/patents/1
      def update
        if @patent.update(patent_params_to_update)
          render json: @patent
        else
          render json: @patent.errors, status: :unprocessable_entity
        end
      end

      # PUT /research_group/:id/patents/1/active
      def change_active
        if @patent.update(patent_params_to_deactivate)
          render json: @patent
        else
          render json: @patent.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_patent
        @patent = @research_group.patents.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def patent_params_to_create
        params.require(:patent).permit(:patent_number, :title,
                                       :date_of_obtaining,
                                       :industrial_publication_gazette,
                                       :observation, :category_id,
                                       :colciencias_call_id,
                                       :patent_state_id,
                                       :created_by, geo_country_ids: [])
      end

      def patent_params_to_update
        params.require(:patent).permit(:patent_number, :title,
                                       :date_of_obtaining,
                                       :industrial_publication_gazette,
                                       :observation, :category_id,
                                       :colciencias_call_id,
                                       :patent_state_id,
                                       :updated_by, geo_country_ids: [])
      end

      def patent_params_to_deactivate
        params.require(:patent).permit(:active, :updated_by)
      end
    end
  end
end