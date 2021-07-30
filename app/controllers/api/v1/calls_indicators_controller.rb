module Api
  module V1
    class CallsIndicatorsController < AbstractCallController
      include Swagger::CallsIndicatorApi

      before_action :set_call, only: [:create]
      before_action :set_calls_indicator, only: [:show, :update]

      # GET calls/:call_id/calls_indicators
      def index
        @calls_indicators = CompleteCallIndicator.where(
          "call_id = ?", params[:call_id]
        )
        @calls_indicators = DxService.load(@calls_indicators, params)

        render json: @calls_indicators
      end

      # GET /calls_indicators/1
      def show
        render json: @calls_indicator
      end

      # POST calls/:call_id/calls_indicators
      def create
        @calls_indicator = @call.calls_indicators.new(calls_ind_params_to_create)

        if @calls_indicator.save
          render json: @calls_indicator, status: :created
        else
          render json: @calls_indicator.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /calls_indicators/1
      def update
        if @calls_indicator.update(calls_ind_params_to_update)
          render json: @calls_indicator
        else
          render json: @calls_indicator.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_calls_indicator
        @calls_indicator = CallsIndicator.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def calls_ind_params_to_create
        params.require(:calls_indicator).permit(:indicator_id,
                                                :clind_required, :clind_quantity,
                                                :active, :created_by)
      end

      def calls_ind_params_to_update
        params.require(:calls_indicator).permit(:call_id, :indicator_id,
                                                :clind_required, :clind_quantity,
                                                :active, :updated_by)
      end
    end
  end
end