module Api
  module V1
    class AppropriationProcessesController < AbstractProductResearchUnitController
      include Swagger::AppropriationProcessApi

      before_action :set_research_group, only: [:index, :create]
      before_action :set_appropriation_process, only: [:show, :update]

      # GET /research_units/:id/appropriation_processes
      def index
        if params[:product_type_id]
          @appropriation_processes = CompleteAppropriationProcess.where(
            "research_group_id = ? AND product_type_id = ?",
            params[:research_group_id], params[:product_type_id]
          )
        else
          @appropriation_processes = CompleteAppropriationProcess.where(
            research_group_id: params[:research_group_id])
        end
        @appropriation_processes = DxService.load(@appropriation_processes, params)

        render json: @appropriation_processes
      end

      # GET /appropriation_processes/1
      def show
        render json: @appropriation_process
      end

      # POST /research_units/:id/appropriation_processes
      def create
        @appropriation_process = @research_group.appropriation_processes.new(
          appn_proc_params_to_create)

        if @appropriation_process.save
          render json: @appropriation_process, status: :created
        else
          render json: @appropriation_process.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /appropriation_processes/1
      def update
        if @appropriation_process.update(appn_proc_params_to_update)
          render json: @appropriation_process
        else
          render json: @appropriation_process.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_appropriation_process
        @appropriation_process = AppropriationProcess.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def appn_proc_params_to_create
        params.require(:appropriation_process).permit(:name, :research_project_title,
                                                      :start_date, :finish_date,
                                                      :funding_institution, :category_id,
                                                      :product_type_id, :research_group_id,
                                                      :colciencias_call_id, :observation,
                                                      :active, :created_by)
      end

      def appn_proc_params_to_update
        params.require(:appropriation_process).permit(:name, :research_project_title,
                                                      :start_date, :finish_date,
                                                      :funding_institution, :category_id,
                                                      :product_type_id, :research_group_id,
                                                      :colciencias_call_id, :observation,
                                                      :active, :updated_by)
      end
    end
  end
end