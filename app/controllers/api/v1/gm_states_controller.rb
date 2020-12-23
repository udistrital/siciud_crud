module Api
  module V1
    class GmStatesController < ApplicationController
      before_action :set_gm_state, only: [:show]

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end

      # GET /gm_states
      def index
        @gm_states = GmState.all.order(:name)

        render json: @gm_states
      end

      # GET /gm_states/id
      def show
        render json: @gm_state
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_gm_state
        @gm_state = GmState.find(params[:id])
      end
    end
  end
end
