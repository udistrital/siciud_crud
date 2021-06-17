module Api
  module V1
    class IdiInvestigationProjectsController < AbstractProductResearchUnitController
      include Swagger::IdiInvestigationProjectApi

      before_action :set_research_group, only: [:index, :create]
      before_action :set_idi_investigation_project, only: [:show, :update]

      # GET research_units/:id/idi_investigation_projects
      def index
        @idi_investigation_projects = CompleteIdiInvestigationProject.where(
          research_group_id: params[:research_group_id])
        @idi_investigation_projects = DxService.load(@idi_investigation_projects, params)
        render json: @idi_investigation_projects
      end

      # GET /idi_investigation_projects/1
      def show
        render json: @idi_investigation_project
      end

      # POST research_units/:id/idi_investigation_projects
      def create
        @idi_investigation_project = @research_group.idi_investigation_projects.new(
          idi_inv_proj_params_to_create)

        if @idi_investigation_project.save
          render json: @idi_investigation_project, status: :created
        else
          render json: @idi_investigation_project.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /idi_investigation_projects/1
      def update
        if @idi_investigation_project.update(idi_inv_proj_params_to_update)
          render json: @idi_investigation_project
        else
          render json: @idi_investigation_project.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_idi_investigation_project
        @idi_investigation_project = IdiInvestigationProject.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def idi_inv_proj_params_to_create
        params.require(:idi_investigation_project).permit(:institution, :contract_number,
                                                          :title, :year, :funding_institution,
                                                          :geo_city_id, :geo_state_id,
                                                          :geo_country_id, :category_id,
                                                          :research_group_id,
                                                          :colciencias_call_id, :observation,
                                                          :active, :created_by)
      end

      # Only allow a trusted parameter "white list" through.
      def idi_inv_proj_params_to_update
        params.require(:idi_investigation_project).permit(:institution, :contract_number,
                                                          :title, :year, :funding_institution,
                                                          :geo_city_id, :geo_state_id,
                                                          :geo_country_id, :category_id,
                                                          :research_group_id,
                                                          :colciencias_call_id, :observation,
                                                          :active, :updated_by)
      end
    end
  end
end