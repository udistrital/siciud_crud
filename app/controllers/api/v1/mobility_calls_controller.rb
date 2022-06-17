module Api
  module V1
    class MobilityCallsController < AbstractCallController
      include Swagger::MobilityCallApi

      before_action :set_call, only: [:create]
      before_action :set_mobility_call, only: [:show, :update]

      # GET /calls/:call_id/mobility_calls
      # GET /researchers/:researcher_id/mobility_calls
      # GET /research_units/:research_group_id/mobility_calls
      # GET /mobility_calls
      def index
        if params[:call_id]
          @mobility_calls = CompleteMobilityCall.where(
            "call_id = ?", params[:call_id]
          )
        elsif params[:researcher_id]
          @mobility_calls = CompleteMobilityCall.where(
            "researcher_id = ?", params[:researcher_id]
          )
        elsif params[:research_group_id]
          @mobility_calls = CompleteMobilityCall.where(
            "research_group_id = ?", params[:research_group_id]
          )
        else
          @mobility_calls = CompleteMobilityCall.all
        end

        @mobility_calls = DxService.load(@mobility_calls, params)

        render json: @mobility_calls
      end

      # GET /mobility_calls/1
      def show
        render json: @mobility_call
      end

      # POST /calls/:call_id/mobility_calls
      def create
        @mobility_call = @call.mobility_calls.new(mobility_call_params_to_create)

        if @mobility_call.save
          render json: @mobility_call, status: :created
        else
          render json: @mobility_call.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /mobility_calls/1
      def update
        if @mobility_call.update(mobility_call_params_to_update)
          render json: @mobility_call
        else
          render json: @mobility_call.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_mobility_call
        @mobility_call = MobilityCall.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def mobility_call_params_to_create
        params.require(:mobility_call).permit(:geo_city_id,
                                              :geo_country_id, :geo_state_id,
                                              :event_name, :event_edition_number,
                                              :event_date, :paper_name,
                                              :is_organizer, :event_page,
                                              :research_group_id, :researcher_id,
                                              :state_id, :total,
                                              :active, :created_by)
      end

      def mobility_call_params_to_update
        params.require(:mobility_call).permit(:call_id, :geo_city_id,
                                              :geo_country_id, :geo_state_id,
                                              :event_name, :event_edition_number,
                                              :event_date, :paper_name,
                                              :is_organizer, :event_page,
                                              :research_group_id, :researcher_id,
                                              :state_id, :total,
                                              :active, :updated_by)
      end
    end
  end
end