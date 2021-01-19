module Api
  module V1
    class ResearchFocusController < ApplicationController
      include Swagger::ResearchFocusApi

      before_action :set_research_focus, only: [:show]

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: { error: e.message }, status: :not_found
      end
      #listar todas las lineas de investigacion
      def index
        @research_focuses = ResearchFocus.all.order(:created_at)
        render json: @research_focuses
      end

      def show
        render json: @research_focus
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_research_focus
        @research_focus = ResearchFocus.find(params[:id])
      end
    end
  end
end
