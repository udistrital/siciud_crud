module Api
  module V1
    class RoleController < ApplicationController
      include Swagger::RoleApi
      before_action :set_role, only: [:show, :update]

      def index
        @roles = Role.all.order(:id)
        render json: @roles
      end

      def show
        render json: @role
      end

      def create
        @role = Role.new(role_params_to_create)
        if @role.save
          render json: @role, status: :created
        else
          render json: @role.errors, status: :unprocessable_entity
        end
      end

      def update
        if @role.update(role_params_to_update)
          render json: @role
        else
          render json: @role.errors, status: :unprocessable_entity
        end
      end

      private

      def set_role
        @role = Role.find(params[:id])
      end

      def role_params_to_create
        params.require(:role).permit(:name, :role_type_id,
                                     :active, :created_by)
      end

      def role_params_to_update
        params.require(:role).permit(:name, :role_type_id,
                                     :active, :updated_by)
      end
    end
  end
end
