module Api
  module V1
    class CallProductionsController < ApplicationController
      before_action :set_call
      before_action :set_production, only: [:update, :destroy]

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      def index
        @call_production = @call.call_productions.order(:production_id)
        render json: @call_production, status: :ok
      end

      def create
        @call_production = @call.call_productions.new(call_production_params)

        if @call_production.save
          render json: @call_production, status: :created
        else
          render json: @call_production.errors, status: :unprocessable_entity
        end
      end

      def update
        if @call_production.update(call_production_update_params)
          render json: @call_production
        else
          render json: @call_production.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @call_production.destroy
      end

      private

      def call_production_params
        params.require(:call_production).permit(:production_id, :required, :quantity)
      end

      def call_production_update_params
        params.require(:call_production).permit(:required, :quantity)
      end

      def set_call
        @call = Call.find(params[:call_id])
      end

      def set_production
        @call_production = @call.call_productions.find_by(id: params[:id])
        unless @call_production
          render json: {error: "Couldn't find call production with 'id'=#{params[:id]}"}
        end
      end
    end
  end
end
