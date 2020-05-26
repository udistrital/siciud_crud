module Api
  module V1
    class ProductionsController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      def index
        @production = Production.all
        render json: @production, status: :ok
      end
    end
  end
end
