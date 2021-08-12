module Api
  module V1
    class OtriProfessionalsController < ApplicationController
      include Swagger::OtriProfessionalApi
      before_action :set_otri_professional, only: [:show, :update, :change_active]

      # GET /otri_professionals
      def index
        @otri_professionals = OtriProfessional.all

        render json: @otri_professionals
      end

      # GET /otri_professionals/:id
      def show
        render json: @otri_professional
      end

      # POST /otri_professionals
      def create
        @otri_professional = OtriProfessional.new(otri_professional_params_new)

        if @otri_professional.save
          render json: @otri_professional, status: :created
        else
          render json: @otri_professional.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /otri_professionals/:id
      def update
        if @otri_professional.update(otri_professional_params_update)
          render json: @otri_professional
        else
          render json: @otri_professional.errors, status: :unprocessable_entity
        end
      end

       # PUT /otri_professionals/:id/active
       def change_active
        if @otri_professional.update(otri_professional_params_to_deactivate)
          render json: @otri_professional
        else
          render json: @otri_professional.errors, status: :unprocessable_entity
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_otri_professional
          @otri_professional = OtriProfessional.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def otri_professional_params_new
          params.require(:otri_professional).permit(:email, :phone, :user_id, :professional_role_id, :created_by)
        end
        def otri_professional_params_update
          params.require(:otri_professional).permit(:email, :phone, :professional_role_id, :updated_by)
        end
        def otri_professional_params_to_deactivate
          params.require(:otri_professional).permit(:active, :updated_by)
        end
    end
  end
end
