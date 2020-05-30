module Api
  module V1
    class ThematicAxesController < ApplicationController
      before_action :set_call, only: [:index, :create]

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      def index
        if params.has_key?("call_id")
          @thematic_axis = @call.thematic_axes
        else
          @thematic_axis = ThematicAxis.all
        end
        render json: @thematic_axis, status: :ok
      end

      def create
        if params.has_key?("call_id")
          @thematic_axis = @call.thematic_axes.new(thematic_params)
        else
          @thematic_axis = ThematicAxis.new(new_thematic_params)
        end
        if @thematic_axis.save
          render json: @thematic_axis, status: :created
        else
          render json: @thematic_axis.errors, status: :unprocessable_entity
        end
      end

      private

      def new_thematic_params
        params.require(:thematic_axis).permit(:name)
      end

      def thematic_params
        params.require(:thematic_axis).permit(:id)
      end

      def set_call
        if params.has_key?("call_id")
          @call = Call.find(params[:call_id])
        end
      end
    end
  end
end
