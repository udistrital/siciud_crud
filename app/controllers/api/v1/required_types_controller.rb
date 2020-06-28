module Api
  module V1
    class RequiredTypesController < ApplicationController

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      def index
        @required_type = RequiredType.all.order(:id)
        render json: @required_type
      end
    end
  end
end
