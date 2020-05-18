module Api
  module V1
    class HealthController < ApplicationController
      def health
        render json: { api: "OK" }, status: :ok
      end
    end
  end
end
