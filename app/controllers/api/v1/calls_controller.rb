module Api
  module V1
    class CallsController < ApplicationController
      include Swagger::CallApi

      before_action :set_call, only: [:show, :update]

      # GET /calls
      def index
        @calls = CompleteCall.all
        @calls = DxService.load(@calls, params)

        render json: @calls
      end

      # GET /calls/1
      def show
        render json: @call
      end

      # POST /calls
      def create
        @call = Call.new(call_params_to_create)
        @call.call_code, msg = CallService.get_call_code(@call.call_type_id)
        if @call.call_code.nil?
          render json: { error: msg }, status: :unprocessable_entity
        else
          if @call.save
            render json: @call, status: :created
          else
            render json: @call.errors, status: :unprocessable_entity
          end
        end
      end

      # PATCH/PUT /calls/1
      def update
        if @call.update(call_params_to_update)
          render json: @call
        else
          render json: @call.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_call
        @call = Call.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def call_params_to_create
        params.require(:call).permit(:call_name, :call_state_id,
                                     :call_type_id, :call_beneficiary_id,
                                     :call_duration, :call_start_date, :call_end_date,
                                     :call_global_budget, :call_max_budget_per_project,
                                     :call_directed_towards, :call_objective, :active,
                                     :created_by)
      end

      def call_params_to_update
        params.require(:call).permit(:call_name, :call_state_id,
                                     :call_type_id, :call_beneficiary_id,
                                     :call_duration, :call_start_date, :call_end_date,
                                     :call_global_budget, :call_max_budget_per_project,
                                     :call_directed_towards, :call_objective, :active,
                                     :updated_by)
      end
    end
  end
end