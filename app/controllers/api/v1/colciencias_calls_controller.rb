module Api
  module V1
    class ColcienciasCallsController < ApplicationController
      before_action :set_colc_call, only: [:update]

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      def index
        @colciencias_call = ColcienciasCall.all.order(:year)
        render json: @colciencias_call
      end

      def create
        @colciencias_call = ColcienciasCall.new(colc_call_params)

        if @colciencias_call.save
          render json: @colciencias_call, status: :created
        else
          render jspn: @colciencias_call.errors, status: :unprocessable_entity
        end
      end

      def update
        if @colciencias_call.update(colc_call_params)
          render json: @colciencias_call, status: :ok
        else
          render json: @colciencias_call.errors, status: :unprocessable_entity
        end
      end

      private

      def colc_call_params
        params.require(:colciencias_call).permit(:name, :year)
      end

      def set_colc_call
        @colciencias_call = ColcienciasCall.find(params["id"])
      end
    end
  end
end
