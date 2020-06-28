module Api
  module V1
    class CallTypesController < ApplicationController

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      def index
        @call_type = CallType.all
        render json: @call_type, status: :ok
      end

      def show
        @call_type = CallType.find(params[:id])
        render json: @call_type, status: :ok
      end
    end
  end
end
