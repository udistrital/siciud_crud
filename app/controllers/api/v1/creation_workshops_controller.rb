module Api
  module V1
    class CreationWorkshopsController < AbstractProductResearchUnitController
      include Swagger::CreationWorkshopApi

      before_action :set_research_group, only: [:index, :create]
      before_action :set_creation_workshop, only: [:show, :update]

      # GET /research_units/:id/creation_workshops
      def index
        @creation_workshops = CompleteCreationWorkshop.where(
          research_group_id: params[:research_group_id])
        @creation_workshops = DxService.load(@creation_workshops, params)

        render json: @creation_workshops
      end

      # GET /creation_workshops/1
      def show
        render json: @creation_workshop
      end

      # POST /research_units/:id/creation_workshops
      def create
        @creation_workshop = @research_group.creation_workshops.new(c_workshop_params_to_create)

        if @creation_workshop.save
          render json: @creation_workshop, status: :created
        else
          render json: @creation_workshop.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /creation_workshops/1
      def update
        if @creation_workshop.update(c_workshop_params_to_update)
          render json: @creation_workshop
        else
          render json: @creation_workshop.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_creation_workshop
        @creation_workshop = CreationWorkshop.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def c_workshop_params_to_create
        params.require(:creation_workshop).permit(:name, :start_date, :finish_date,
                                                  :funding_institution, :organization_name,
                                                  :geo_city_id, :geo_state_id, :geo_country_id,
                                                  :participation_id, :category_id,
                                                  :research_group_id, :colciencias_call_id,
                                                  :observation, :active, :created_by)
      end

      def c_workshop_params_to_update
        params.require(:creation_workshop).permit(:name, :start_date, :finish_date,
                                                  :funding_institution, :organization_name,
                                                  :geo_city_id, :geo_state_id, :geo_country_id,
                                                  :participation_id, :category_id,
                                                  :research_group_id, :colciencias_call_id,
                                                  :observation, :active, :updated_by)
      end
    end
  end
end