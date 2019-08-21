module Api
  module V1
    class RoleController < ApplicationController
      before_action :set_role, only: [:show]

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: { error: e.message }, status: :not_found
      end

      #listar todos los posibles estados de un grupo
      def index
        @roles = Role.all
        render json: @roles
      end

      def show
        render json: @role
      end

      private

      # Use set_role to share common setup or constraints between actions.
      def set_state_researcher
        @role = Role.find(params[:id])
      end
    end
  end
end
