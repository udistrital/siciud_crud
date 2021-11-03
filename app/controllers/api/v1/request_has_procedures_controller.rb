module Api
  module V1
    class RequestHasProceduresController < ApplicationController
      include Swagger::RequestHasProcedureApi
      before_action :set_request_has_procedure, only: [:show, :update, :change_active]

      # GET /request_has_procedures
      def index
        @request_has_procedures = RequestHasProcedure.all

        render json: @request_has_procedures
      end

      # GET /request_has_procedures/1
      def show
        render json: @request_has_procedure
      end

      # POST /request_has_procedures
      def create
        @request_has_procedure = RequestHasProcedure.new(request_has_procedure_params_new)

        if @request_has_procedure.save
          render json: @request_has_procedure, status: :created
        else
          render json: @request_has_procedure.errors, status: :unprocessable_entity
        end
      end

      # PUT /request_has_procedures/:id/active
      def change_active
        if @request_has_procedure.update(request_has_procedure_params_to_deactivate)
          render json: @request_has_procedure
        else
          render json: @request_has_procedure.errors, status: :unprocessable_entity
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_request_has_procedure
          @request_has_procedure = RequestHasProcedure.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def request_has_procedure_params_new
          params.require(:request_has_procedure).permit(:procedure_id, :procedure_request_id, :created_by)
        end

        def request_has_procedure_params_to_deactivate
          params.require(:request_has_procedure).permit(:active, :updated_by)
        end
    end
  end
end
