module Api
  module V1
    class ExtensionProjectsController < AbstractProductResearchUnitController
      include Swagger::ExtensionProjectApi

      before_action :set_research_group, only: [:index, :create]
      before_action :set_extension_project, only: [:show, :update]

      # GET research_units/:id/extension_projects
      def index
        @extension_projects = CompleteExtensionProject.where(
          research_group_id: params[:research_group_id])

        render json: @extension_projects
      end

      # GET /extension_projects/1
      def show
        render json: @extension_project
      end

      # POST research_units/:id/extension_projects
      def create
        @extension_project = @research_group.extension_projects.new(
          ext_project_params_to_create)

        if @extension_project.save
          render json: @extension_project, status: :created
        else
          render json: @extension_project.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /extension_projects/1
      def update
        if @extension_project.update(ext_project_params_to_update)
          render json: @extension_project
        else
          render json: @extension_project.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_extension_project
        @extension_project = ExtensionProject.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def ext_project_params_to_create
        params.require(:extension_project).permit(:institution, :administrative_act,
                                                  :project_name, :start_date,
                                                  :name_ext_project, :final_date,
                                                  :community_name, :geo_city_id,
                                                  :geo_state_id, :geo_country_id,
                                                  :category_id, :research_group_id,
                                                  :colciencias_call_id, :observation,
                                                  :active, :created_by)
      end

      # Only allow a trusted parameter "white list" through.
      def ext_project_params_to_update
        params.require(:extension_project).permit(:institution, :administrative_act,
                                                  :project_name, :start_date,
                                                  :name_ext_project, :final_date,
                                                  :community_name, :geo_city_id,
                                                  :geo_state_id, :geo_country_id,
                                                  :category_id, :research_group_id,
                                                  :colciencias_call_id, :observation,
                                                  :active, :updated_by)
      end
    end
  end
end