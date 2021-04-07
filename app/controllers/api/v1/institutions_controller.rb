module Api
  module V1
    class InstitutionsController < ApplicationController
      before_action :set_institution, only: [:show, :update, :change_active]
      before_action only: [:change_active] do
        active_in_body_params? institution_params_to_deactivate
      end

      # GET /institutions
      def index
        @institutions = Institution.all.order(:inst_name)

        render json: @institutions
      end

      # GET /institutions/1
      def show
        render json: @institution
      end

      # POST /institutions
      def create
        @institution = Institution.new(institution_params_to_create)

        if @institution.save
          render json: @institution, status: :created
        else
          render json: @institution.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /institutions/1
      def update
        if @institution.update(institution_params_to_update)
          render json: @institution
        else
          render json: @institution.errors, status: :unprocessable_entity
        end
      end

      # PUT /institutions/1/active
      def change_active
        if @institution.update(institution_params_to_deactivate)
          render json: @institution
        else
          render json: @institution.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_institution
        @institution = Institution.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def institution_params_to_create
        params.require(:institution).permit(:inst_name, :created_by)
      end

      def institution_params_to_update
        params.require(:institution).permit(:inst_name, :updated_by)
      end

      def institution_params_to_deactivate
        params.require(:institution).permit(:active, :updated_by)
      end
    end
  end
end