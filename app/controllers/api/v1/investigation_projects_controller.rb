module Api
  module V1
    class InvestigationProjectsController < AbstractProductResearchUnitController
      include Swagger::InvestigationProjectApi

      before_action :set_research_group, only: [:index, :create]
      before_action :set_investigation_project, only: [:show, :update]

      # GET research_units/:id/investigation_projects
      def index
        if params[:product_type_id]
          @investigation_projects = CompleteInvestigationProject.where(
            "research_group_id = ? AND product_type_id = ?",
            params[:research_group_id], params[:product_type_id]
          )
        else
          @investigation_projects = CompleteInvestigationProject.where(
            research_group_id: params[:research_group_id])
        end
        @investigation_projects = DxService.load(@investigation_projects, params)
        render json: @investigation_projects
      end

      # GET /investigation_projects/1
      def show
        render json: @investigation_project
      end

      # POST research_units/:id/investigation_projects
      def create
        @investigation_project = @research_group.investigation_projects.new(
          investigation_project_params_to_create)

        if @investigation_project.save
          render json: @investigation_project, status: :created
        else
          render json: @investigation_project.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /investigation_projects/1
      def update
        if @investigation_project.update(investigation_project_params_to_update)
          render json: @investigation_project
        else
          render json: @investigation_project.errors, status: :unprocessable_entity
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_investigation_project
        @investigation_project = InvestigationProject.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def investigation_project_params_to_create
        params.require(:investigation_project).permit(:institution, :title, :year,
                                                      :funding_institution,
                                                      :product_type_id, :geo_city_id,
                                                      :geo_state_id, :geo_country_id,
                                                      :category_id, :research_group_id,
                                                      :colciencias_call_id,
                                                      :observation, :active,
                                                      :created_by)
      end

      # Only allow a trusted parameter "white list" through.
      def investigation_project_params_to_update
        params.require(:investigation_project).permit(:institution, :title, :year,
                                                      :funding_institution,
                                                      :product_type_id, :geo_city_id,
                                                      :geo_state_id, :geo_country_id,
                                                      :category_id, :research_group_id,
                                                      :colciencias_call_id,
                                                      :observation, :active,
                                                      :updated_by)
      end
    end
  end
end