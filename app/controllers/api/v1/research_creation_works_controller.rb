module Api
  module V1
    class ResearchCreationWorksController < AbstractProductResearchUnitController
      before_action :set_research_group
      before_action :set_research_creation_work, only: [:show, :update]

      # GET /research_group/:id/research_creation_works
      def index
        @research_creation_works = @research_group.research_creation_works

        render json: @research_creation_works
      end

      # GET /research_group/:id/research_creation_works/1
      def show
        render json: @research_creation_work
      end

      # POST /research_group/:id/research_creation_works
      def create
        @research_creation_work = @research_group.research_creation_works.new(
            research_creation_work_params)

        if @research_creation_work.save
          render json: @research_creation_work, status: :created
        else
          render json: @research_creation_work.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_group/:id/research_creation_works/1
      def update
        if @research_creation_work.update(research_creation_work_params)
          render json: @research_creation_work
        else
          render json: @research_creation_work.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_research_creation_work
        @research_creation_work = @research_group.research_creation_works.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def research_creation_work_params
        params.require(:research_creation_work).permit(:title, :creation_and_selection_date,
                                                       :nature_of_work,
                                                       :registered_project_title,
                                                       :url, :observation, :knwl_spec_area_id,
                                                       :category_id, :geo_city_id,
                                                       work_type_ids: [])
      end
    end
  end
end
