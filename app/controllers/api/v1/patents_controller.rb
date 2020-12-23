module Api
  module V1
    class PatentsController < AbstractProductResearchUnitController
      before_action :set_research_group, only: [:index, :show, :create, :update]
      before_action :set_patent, only: [:show, :update]

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
        @patent = @research_group.patents.new(patent_params)

        if @patent.save
          render json: @patent, status: :created
        else
          render json: @patent.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_group/:id/patents/1
      def update
        if @patent.created_by.nil?
          # Update user of created_by only this is nil
          if @patent.update(patent_params)
            render json: @patent
          else
            render json: @patent.errors, status: :unprocessable_entity
          end
        else
          if @patent.update(patent_params.except(:created_by))
            render json: @patent
          else
            render json: @patent.errors, status: :unprocessable_entity
          end
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_patent
        @patent = @research_group.patents.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def patent_params
        params.require(:patent).permit(:patent_number, :title, :date_of_obtaining,
                                       :industrial_publication_gazette,
                                       :observation, :category_id,
                                       :patent_state_id,
                                       :patent_certificate_document,
                                       :active, :created_by, :updated_by,
                                       geo_country_ids: [])
      end
    end
  end
end