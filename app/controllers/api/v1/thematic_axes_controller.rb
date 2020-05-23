module Api
  module V1
    class ThematicAxesController < ApplicationController

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      def index
        @thematic_axis = ThematicAxis.all
        render json: @thematic_axis
      end

      def create
        @thematic_axis = ThematicAxis.new(thematic_params)
        if @thematic_axis.save
          render json: @thematic_axis, status: :created
        else
          render json: @thematic_axis.errors, status: :unprocessable_entity
        end
      end

      private

      def thematic_params
        params.require(:thematic_axis).permit(:name)
      end
    end
  end
end
