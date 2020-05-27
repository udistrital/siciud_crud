module Api
  module V1
    class CallProductionsController < ApplicationController
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
        @call_production = @call.call_productions.new(call_production_params)

        if @call_production.save
          render json: @call_production, status: :created
        else
          render json: @call_production.errors, status: :unprocessable_entity
        end
      end

      private

      def call_production_params
        params.require(:call_production).permit(:production_id, :required, :quantity)
      end

      def set_call
        @call = Call.find(params[:call_id])
      end
    end
  end
end
