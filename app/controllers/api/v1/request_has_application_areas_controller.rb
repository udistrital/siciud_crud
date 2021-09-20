module Api
  module V1
    class RequestHasApplicationAreasController < ApplicationController
      include Swagger::RequestHasApplicationAreaApi
      before_action :set_procedure_request, only: [:index, :create]
      before_action :set_request_has_application_area, only: [:change_active]

      # GET /procedure_requests/:procedure_request_id/request_has_application_areas
      def index
        @request_has_application_areas = @procedure_request.request_has_application_areas

        render json: @request_has_application_areas
      end

      # POST /procedure_requests/:procedure_request_id/request_has_application_areas
      def create
        @request_has_application_area = @procedure_request.request_has_application_areas.new(request_has_application_area_params_new)

        if @request_has_application_area.save
          render json: @request_has_application_area, status: :created
        else
          render json: @request_has_application_area.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /request_has_application_areas/1
      def update
        if @request_has_application_area.update(request_has_application_area_params_update)
          render json: @request_has_application_area
        else
          render json: @request_has_application_area.errors, status: :unprocessable_entity
        end
      end

      # PUT /request_has_application_areas/:id/active
      def change_active
        if @request_has_application_area.update(request_has_application_area_to_deactivate)
          render json: @request_has_application_area
        else
          render json: @request_has_application_area.errors, status: :unprocessable_entity
        end
      end


      private
        # Use callbacks to share common setup or constraints between actions.
        def set_request_has_application_area
          @request_has_application_area = RequestHasApplicationArea.find(params[:id])
        end
        
        def set_procedure_request
          @procedure_request = ProcedureRequest.find(params[:procedure_request_id])
        end
        # Only allow a trusted parameter "white list" through.
        def request_has_application_area_params_new
          params.require(:request_has_application_area).permit(:application_area_id, :created_by)
        end

        def request_has_application_area_params_update
          params.require(:request_has_application_area).permit(:updated_by)
        end

        def request_has_application_area_to_deactivate
          params.require(:request_has_application_area).permit(:active, :updated_by)
        end
    end
  end
end
