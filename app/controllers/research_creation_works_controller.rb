module Api
  module V1
    class ResearchCreationWorksController < ApplicationController
      before_action :set_research_creation_work, only: [:show, :update, :attach]

      # Handling of database exceptions
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      # GET /research_creation_works
      def index
        @research_creation_works = ResearchCreationWork.all

        render json: @research_creation_works
      end

      # GET /research_creation_works/1
      def show
        render json: @research_creation_work
      end

      # POST /research_creation_works
      def create
        @research_creation_work = ResearchCreationWork.new(research_creation_work_params)

        if @research_creation_work.save
          render json: @research_creation_work, status: :created, location: @research_creation_work
        else
          render json: @research_creation_work.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_creation_works/1
      def update
        if @research_creation_work.update(research_creation_work_params)
          render json: @research_creation_work
        else
          render json: @research_creation_work.errors, status: :unprocessable_entity
        end
      end

      # PUT /research_creation_works/1/attach
      def attach
        params.permit(:certificate_work_document)
        if (file = params[:certificate_work_document])
          if (file.content_type == "application/pdf")
            @research_creation_work.certificate_work_document.attach(file)
          else
            return render json: {"error": "El acta del cidc #{msq}"},
                          status: :unprocessable_entity
          end
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_research_creation_work
        @research_creation_work = ResearchCreationWork.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def research_creation_work_params
        params.require(:research_creation_work).permit(:title, :creation_and_selection_date,
                                                       :nature_of_work, :registered_project_title,
                                                       :url, :observation, :knwl_spec_area_id,
                                                       :category_id, :research_group_id)
      end
    end
  end
end
