module Api
  module V1
    class PapersController < AbstractProductResearchUnitController
      before_action only: [:create, :update] do
        validate_created_by(paper_params)
        validate_updated_by(paper_params)
      end
      before_action :set_research_group, only: [:index, :show, :create, :update]
      before_action :set_paper, only: [:show, :update]

      # GET /research_group/:id/papers
      def index
        @papers = DxService.load(CompletePaper, params)
        render json: @papers
      end

      # GET /research_group/:id/papers/1
      def show
        render json: @paper
      end

      # POST /research_group/:id/papers
      def create
        @paper = @research_group.papers.new(paper_params.except(:journal_name))
        journal = set_journal(params[:paper][:journal_name], @paper.created_by,
                              @paper.updated_by)
        if journal
          @paper.journal = journal
        else
          return
        end

        if @paper.save
          render json: @paper, status: :created
        else
          render json: @paper.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_group/:id/papers/1
      def update
        journal = set_journal(params[:paper][:journal_name], @paper.created_by,
                              @paper.updated_by)
        if journal
          @paper.journal = journal
        else
          return
        end

        if @paper.created_by.nil?
          # Update user of created_by only this is nil
          if @paper.update(paper_params.except(:journal_name))
            render json: @paper
          else
            render json: @paper.errors, status: :unprocessable_entity
          end
        else
          if @paper.update(paper_params.except(:journal_name, :created_by))
            render json: @paper
          else
            render json: @paper.errors, status: :unprocessable_entity
          end
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
                                      :final_page, :issn, :url, :doi,
                                      :observation, :category_id, :paper_type_id,
                                      :geo_city_id, :journal_name, :active,
                                      :created_by, :updated_by)
      end
    end
  end
end
