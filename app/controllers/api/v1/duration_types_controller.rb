module Api
  module V1
    class DurationTypesController < ApplicationController

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      def index
        @duration_type = DurationType.all
        render json: @duration_type
      end
    end
  end
end
