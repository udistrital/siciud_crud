module Api
  module V1
    class CallItemCallsController < ApplicationController
      before_action :set_call

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      def index
      end

      def create
        @call_item_call = @call.call_item_calls.new(call_item_params)

        if @call_item_call.save
          render json: @call_item_call, status: :created
        else
          render json: @call_item_call.errors, status: :unprocessable_entity
        end
      end

      private

      def call_item_params
        params.require(:call_item_call).permit(:item_call_id,
                                               :percentage, :value,
                                               :maximum_percentage)
      end

      def set_call
        @call = Call.find(params[:call_id])
      end
    end
  end
end
