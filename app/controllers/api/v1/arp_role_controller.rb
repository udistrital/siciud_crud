module Api
  module V1
    class ArpRoleController < ApplicationController
      before_action :set_arp_role, only: [:show]

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: { error: e.message }, status: :not_found
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: { error: e.message }, status: :unprocessable_entity
      end

      #listar todos los roles de un investigador en un proyecto
      def index
        @arp_roles = ArpRole.all
        render json: @arp_roles
      end

      def show
        render json: @arp_role
      end

      def create
        @arp_role = ArpRole.new(arp_role_params)
        if @arp_role.save
          render json: @arp_role, status: :created
        else
          render json: @arp_role.errors, status: :unprocessable_entity
        end
      end

      private

      # Use set_role to share common setup or constraints between actions.
      def set_arp_role
        @arp_role = ArpRole.find(params[:id])
      end

      def arp_role_params
        params.require(:arp_role).permit(:name)
      end
    end
  end
end
