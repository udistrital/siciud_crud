module Api
  module V1
    class CallUserRolesController < ApplicationController

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      def index
        @call_user_role = CallUserRole.all
        render json: @call_user_role, status: :ok
      end

      def show
      end
    end
  end
end
