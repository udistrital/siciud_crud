module Api
  module V1
    class PapersController < AbstractProductResearchUnitController
      include Swagger::PaperApi

      before_action :set_research_group
      before_action :set_paper, only: [:show, :update, :change_active]
      before_action only: [:change_active] do
        active_in_body_params? paper_params_to_deactivate
      end

      # GET /research_group/:id/papers
      def index
        list_papers = CompletePaper.where(
          research_group_id: params[:research_group_id])
        @papers = DxService.load(list_papers, params)
        render json: @papers
      end

      # GET /research_group/:id/papers/1
      def show
        render json: @paper
      end

      # POST /research_group/:id/papers
      def create
        @paper = @research_group.papers.new(paper_params_to_create)

        if @paper.save
          render json: @paper, status: :created
        else
          render json: @paper.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_group/:id/papers/1
      def update
        if @paper.update(paper_params_to_update)
          render json: @paper
        else
          render json: @paper.errors, status: :unprocessable_entity
        end
      end

      # PUT /research_group/:id/papers/1/active
      def change_active
        if @paper.update(paper_params_to_deactivate)
          render json: @paper
        else
          render json: @paper.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_paper
        @paper = @research_group.papers.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def paper_params_to_create
        params.require(:paper).permit(:title, :publication_date,
                                      :approval_date, :volume,
                                      :number_of_pages, :initial_page,
                                      :final_page, :issn, :url, :doi,
                                      :observation, :category_id,
                                      :colciencias_call_id,
                                      :paper_type_id,
                                      :geo_city_id, :journal_name,
                                      :created_by)
      end

      def paper_params_to_update
        params.require(:paper).permit(:title, :publication_date,
                                      :approval_date, :volume,
                                      :number_of_pages, :initial_page,
                                      :final_page, :issn, :url, :doi,
                                      :observation, :category_id, :paper_type_id,
                                      :colciencias_call_id,
                                      :geo_city_id, :journal_name, :updated_by)
      end

      def paper_params_to_deactivate
        params.require(:paper).permit(:active, :updated_by)
      end
    end
  end
end
