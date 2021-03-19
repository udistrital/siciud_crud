module Api
  module V1
    class ResearchCreationWorksController < AbstractProductResearchUnitController
      include Swagger::ResearchCreationWorkApi

      before_action :set_research_group
      before_action :set_research_creation_work, only: [:show, :update, :change_active]
      before_action only: [:change_active] do
        active_in_body_params? rcw_params_to_deactivate
      end

      # GET /research_group/:id/research_creation_works
      def index
        rcws = CompleteResearchCw.where(
          research_group_id: params[:research_group_id])
        @research_creation_works = DxService.load(rcws, params)
        render json: @research_creation_works
      end

      # GET /research_group/:id/research_creation_works/1
      def show
        render json: @research_creation_work
      end

      # POST /research_group/:id/research_creation_works
      def create
        @research_creation_work = @research_group.research_creation_works.new(
          rcw_params_to_create.except(:work_type_ids))
        work_type_ids = rcw_params_to_create[:work_type_ids]

        if @research_creation_work.save
          save_work_type(@research_creation_work, work_type_ids)
          render json: @research_creation_work, status: :created
        else
          render json: @research_creation_work.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_group/:id/research_creation_works/1
      def update
        work_type_ids = rcw_params_to_create[:work_type_ids]

        if @research_creation_work.update(
          rcw_params_to_update.except(:work_type_ids))
          save_work_type(@research_creation_work, work_type_ids)
          render json: @research_creation_work
        else
          render json: @research_creation_work.errors, status: :unprocessable_entity
        end
      end

      # PUT /research_group/:id/research_creation_works/1/active
      def change_active
        if @research_creation_work.update(rcw_params_to_deactivate)
          render json: @research_creation_work
        else
          render json: @research_creation_work.errors, status: :unprocessable_entity
        end
      end

      private

      def save_work_type(research_creation_work, work_type_ids)
        research_creation_work.work_type_ids = (work_type_ids).map(&:to_i).uniq
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_research_creation_work
        @research_creation_work = @research_group.research_creation_works.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def rcw_params_to_create
        params.require(:research_creation_work).permit(
          :title, :creation_and_selection_date, :nature_of_work,
          :registered_project_title, :url, :observation, :knwl_spec_area_id,
          :category_id, :geo_city_id, :created_by, work_type_ids: []
        )
      end

      def rcw_params_to_update
        params.require(:research_creation_work).permit(
          :title, :creation_and_selection_date, :nature_of_work,
          :registered_project_title, :url, :observation, :knwl_spec_area_id,
          :category_id, :geo_city_id, :updated_by, work_type_ids: []
        )
      end

      def rcw_params_to_deactivate
        params.require(:research_creation_work).permit(:active, :updated_by)
      end
    end
  end
end
