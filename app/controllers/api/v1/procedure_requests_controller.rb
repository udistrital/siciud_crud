module Api
  module V1
    class ProcedureRequestsController < ApplicationController
      include Swagger::ProcedureRequestApi
      before_action :set_procedure_request, only: [:show, :update, :change_active]

      # GET /procedure_requests
      def index
        @procedure_request = ProcedureRequest.all

        render json: @procedure_request
      end

      # GET /procedure_requests/1
      def show
        render json: @procedure_request
      end

      # POST /procedure_requests
      def create
        @procedure_request = ProcedureRequest.new(procedure_request_params_new)

        if @procedure_request.save
          render json: @procedure_request, status: :created
        else
          render json: @procedure_request.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /procedure_requests/1
      def update
        if @procedure_request.update(procedure_request_params_update)
          render json: @procedure_request
        else
          render json: @procedure_request.errors, status: :unprocessable_entity
        end
      end

      # PUT /procedure_requests/:id/active
      def change_active
        if @procedure_request.update(procedure_request_params_to_deactivate)
          render json: @procedure_request
        else
          render json: @procedure_request.errors, status: :unprocessable_entity
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_procedure_request
          @procedure_request = ProcedureRequest.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def procedure_request_params_new
          params.require(:procedure_request).permit(:approached_problem, :created_by)
        end
        def procedure_request_params_update
          params.require(:procedure_request).permit(:approached_problem, :updated_by)
        end
        def procedure_request_params_to_deactivate
          params.require(:procedure_request).permit(:active, :updated_by)
        end
    end
  end
end
