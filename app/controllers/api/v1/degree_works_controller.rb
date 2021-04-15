module Api
  module V1
    class DegreeWorksController < AbstractProductResearchUnitController
      include Swagger::DegreeWorkApi

      before_action :set_research_group
      before_action :set_degree_work, only: [:show, :update, :change_active]
      before_action only: [:change_active] do
        active_in_body_params? dw_params_to_deactivate
      end

      # GET /research_units/:id/degree_works
      def index
        if params[:dw_type_id]
          @degree_works = CompleteDegreeWork.where(
            "research_group_id = ? AND dw_type_id = ?",
            params[:research_group_id], params[:dw_type_id]
          )
        else
          @degree_works = CompleteDegreeWork.where(
            research_group_id: params[:research_group_id]
          )
        end
        @degree_works = DxService.load(@degree_works, params)

        render json: @degree_works
      end

      # GET /research_units/:id/degree_works/1
      def show
        render json: @degree_work
      end

      # POST /research_units/:id/degree_works
      def create
        @degree_work = @research_group.degree_works.new(
          degree_work_params_to_create)

        if @degree_work.save
          render json: @degree_work, status: :created
        else
          render json: @degree_work.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_units/:id/degree_works/1
      def update
        if @degree_work.update(degree_work_params_to_update)
          render json: @degree_work
        else
          render json: @degree_work.errors, status: :unprocessable_entity
        end
      end

      # PUT /research_units/:id/degree_works/1/active
      def change_active
        if @degree_work.update(dw_params_to_deactivate)
          render json: @degree_work
        else
          render json: @degree_work.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_degree_work
        @degree_work = @research_group.degree_works.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def degree_work_params_to_create
        params.require(:degree_work).permit(:dw_title, :dw_date,
                                            :dw_institution_name, :dw_recognition,
                                            :category_id, :colciencias_call_id,
                                            :dw_observation, :dw_type_id,
                                            :created_by)
      end

      def degree_work_params_to_update
        params.require(:degree_work).permit(:dw_title, :dw_date,
                                            :dw_institution_name, :dw_recognition,
                                            :category_id, :colciencias_call_id,
                                            :dw_observation, :dw_type_id,
                                            :updated_by)
      end

      def dw_params_to_deactivate
        params.require(:degree_work).permit(:active, :updated_by)
      end
    end
  end
end