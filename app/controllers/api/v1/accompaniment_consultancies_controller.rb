module Api
  module V1
    class AccompanimentConsultanciesController < AbstractProductResearchUnitController
      include Swagger::AccompanimentConsultancyApi

      before_action :set_research_group, only: [:index, :create]
      before_action :set_accompaniment_consultancy, only: [:show, :update, :destroy]

      # GET research_units/:id/accompaniment_consultancies
      def index
        @accompaniment_consultancies = CompleteAccompanimentConsultancy.where(
          research_group_id: params[:research_group_id])
        @accompaniment_consultancies = DxService.load(@accompaniment_consultancies, params)
        render json: @accompaniment_consultancies
      end

      # GET /accompaniment_consultancies/1
      def show
        render json: @accompaniment_consultancy
      end

      # POST research_units/:id/accompaniment_consultancies
      def create
        @accompaniment_consultancy = @research_group.accompaniment_consultancies.new(
          accompaniment_consultancy_params_to_create)

        if @accompaniment_consultancy.save
          render json: @accompaniment_consultancy, status: :created
        else
          render json: @accompaniment_consultancy.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /accompaniment_consultancies/1
      def update
        if @accompaniment_consultancy.update(accompaniment_consultancy_params_to_update)
          render json: @accompaniment_consultancy
        else
          render json: @accompaniment_consultancy.errors, status: :unprocessable_entity
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_accompaniment_consultancy
        @accompaniment_consultancy = AccompanimentConsultancy.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def accompaniment_consultancy_params_to_create
        params.require(:accompaniment_consultancy).permit(:institution, :project_name,
                                                          :date, :geo_city_id, :geo_state_id,
                                                          :geo_country_id, :category_id,
                                                          :research_group_id, :colciencias_call_id,
                                                          :observation, :active, :created_by)
        end
        # Only allow a trusted parameter "white list" through.
        def accompaniment_consultancy_params_to_update
          params.require(:accompaniment_consultancy).permit(:institution, :project_name,
                                                            :date, :geo_city_id, :geo_state_id,
                                                            :geo_country_id, :category_id,
                                                            :research_group_id, :colciencias_call_id,
                                                            :observation, :active, :updated_by)
      end
    end
  end
end