module Api
  module V1
    class PapersController < AbstractProductResearchUnitController
      before_action :set_research_group
      before_action :set_paper, only: [:show, :update]

      # GET /research_group/:id/papers
      def index
        @papers = @research_group.papers
        render json: @papers
      end

      # GET /research_group/:id/papers/1
      def show
        render json: @paper
      end

      # POST /research_group/:id/papers
      def create
        @paper = @research_group.papers.new(paper_params)
        journal = set_journal(params[:paper][:journal_name])
        if journal
          @paper.journal = journal
        end

        if @paper.save
          render json: @paper, status: :created
        else
          render json: @paper.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_group/:id/papers/1
      def update
        if @paper.update(paper_params)
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
      def paper_params
        params.require(:paper).permit(:title, :publication_date, :approval_date,
                                      :volume, :number_of_pages, :initial_page,
                                      :final_page, :issn, :url, :doi, :observation,
                                      :category_id, :paper_type_id, :geo_city_id)
      end
    end
  end
end
