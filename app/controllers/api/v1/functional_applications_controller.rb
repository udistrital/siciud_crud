module Api
  module V1
    class FunctionalApplicationsController < ApplicationController
      include Swagger::FunctionalApplicationApi
      before_action :set_functional_application, only: [:show, :update, :change_active]
      before_action :set_procedure_request, only: [:index, :create]

      # GET /procedure_requests/:procedure_request_id/functional_applications
      def index
        @functional_applications = @procedure_request.functional_application

        render json: @functional_applications
      end

      # GET /functional_applications/1
      def show
        render json: @functional_application
      end

      # POST /procedure_requests/:procedure_request_id/functional_applications
      def create
        @functional_application = @procedure_request.create_functional_application(functional_application_params_new)

        if @functional_application.save
          render json: @functional_application, status: :created
        else
          render json: @functional_application.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /functional_applications/1
      def update
        if @functional_application.update(functional_application_params_update)
          render json: @functional_application
        else
          render json: @functional_application.errors, status: :unprocessable_entity
        end
      end

      # PUT /functional_applications/:id/active
      def change_active
        if @functional_application.update(functional_application_params_to_deactivate)
          render json: @functional_application
        else
          render json: @functional_application.errors, status: :unprocessable_entity
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_functional_application
          @functional_application = FunctionalApplication.find(params[:id])
        end
        def set_procedure_request
          @procedure_request = ProcedureRequest.find(params[:procedure_request_id])
        end
        # Only allow a trusted parameter "white list" through.
        def functional_application_params_new
          params.require(:functional_application).permit( :actual_applications, :future_applications, 
                                                          :alternative_technologies, :advantages, :procedure_request_id, :created_by)
        end
        def functional_application_params_update
          params.require(:functional_application).permit( :actual_applications, :future_applications, 
                                                          :alternative_technologies, :advantages, :updated_by)
        end
        def functional_application_params_to_deactivate
          params.require(:functional_application).permit(:active, :updated_by)
        end 
    end
  end
end
