module Api
  module V1
    class StateResearcherController < ApplicationController
      before_action :set_state_researcher, only: [:show]

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: { error: e.message }, status: :not_found
      end

      #listar todos los posibles estados de un grupo
      def index
        @state_researcher = StateResearcher.all
        render json: @state_researcher
      end

      def show
        render json: @state_researcher
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_state_researcher
        @state_researcher = StateResearcher.find(params[:id])
      end
    end
  end
end
