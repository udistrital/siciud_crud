module Api
  module V1
    class ProfessionalRolesController < ApplicationController
      include Swagger::ProfessionalRoleApi
      before_action :set_professional_role, only: [:show, :update]

      # GET /professional_roles
      def index
        @professional_roles = ProfessionalRole.all

        render json: @professional_roles
      end

      # GET /professional_roles/1
      def show
        render json: @professional_role
      end

      # POST /professional_roles
      def create
        @professional_role = ProfessionalRole.new(professional_role_params_new)

        if @professional_role.save
          render json: @professional_role, status: :created
        else
          render json: @professional_role.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /professional_roles/1
      def update
        if @professional_role.update(professional_role_params_update)
          render json: @professional_role
        else
          render json: @professional_role.errors, status: :unprocessable_entity
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_professional_role
          @professional_role = ProfessionalRole.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def professional_role_params_new
          params.require(:professional_role).permit(:name, :created_by)
        end
        def professional_role_params_update
          params.require(:professional_role).permit(:name, :updated_by)
        end
    end
  end
end
