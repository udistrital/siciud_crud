module Api
  module V1
    class StateSeedbedController < ApplicationController
      before_action :set_state_group, only: [:show]

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: { error: e.message }, status: :not_found
      end

      #listar todos los posibles estados de un grupo
      def index
        @states_seedbed = StateSeedbed.all
        render json: @states_seedbed
      end

      def show
        render json: @state_seedbed
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_state_group
        @state_seedbed = StateSeedbed.find(params[:id])
      end
    end
  end
end
