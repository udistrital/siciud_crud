module Api
  module V1
    class WorkingPapersController < AbstractProductResearchUnitController
      include Swagger::WorkingPaperApi

      before_action :set_research_group, only: [:index, :create]
      before_action :set_working_paper, only: [:show, :update]

      # GET /research_units/:id/working_papers
      def index
        @working_papers = CompleteWorkingPaper.where(
          research_group_id: params[:research_group_id])
        @working_papers = DxService.load(@working_papers, params)

        render json: @working_papers
      end

      # GET /working_papers/1
      def show
        render json: @working_paper
      end

      # POST /research_units/:id/working_papers
      def create
        @working_paper = @research_group.working_papers.new(working_paper_params_to_create)

        if @working_paper.save
          render json: @working_paper, status: :created
        else
          render json: @working_paper.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /working_papers/1
      def update
        if @working_paper.update(working_paper_params_to_update)
          render json: @working_paper
        else
          render json: @working_paper.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_working_paper
        @working_paper = WorkingPaper.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def working_paper_params_to_create
        params.require(:working_paper).permit(:title, :elaboration_date, :related_institution,
                                              :doi, :web_page, :category_id,
                                              :research_group_id, :colciencias_call_id,
                                              :observation, :active, :created_by)
      end

      def working_paper_params_to_update
        params.require(:working_paper).permit(:title, :elaboration_date, :related_institution,
                                              :doi, :web_page, :category_id,
                                              :research_group_id, :colciencias_call_id,
                                              :observation, :active, :updated_by)
      end
    end
  end
end