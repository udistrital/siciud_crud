module Api
  module V1
    class RoleController < ApplicationController
      include Swagger::RoleApi
      before_action :set_role, only: [:show]

      #listar todos los posibles estados de un grupo
      def index
        @roles = Role.all.order(:created_at)
        render json: @roles
      end

      def show
        render json: @role
      end

      private

      # Use set_role to share common setup or constraints between actions.
      def set_role
        @role = Role.find(params[:id])
      end
    end
  end
end
