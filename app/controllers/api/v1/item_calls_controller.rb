module Api
  module V1
    class ItemCallsController < ApplicationController
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      def index
        @item_call = ItemCall.all
        render json: @item_call, status: :ok
      end
    end
  end
end
