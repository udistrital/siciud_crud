module Api
  module V1    
    class TechnologyDescriptionsController < ApplicationController
      include Swagger::TechnologyDescriptionApi
      before_action :set_technology_description, only: [:show, :update, :change_active]
      before_action :set_procedure_request, only: [:index, :create]

      # GET /procedure_requests/:procedure_request_id/technology_descriptions
      def index
        @technology_descriptions = @procedure_request.technology_description

        render json: @technology_descriptions
      end

      # GET /technology_descriptions/1
      def show
        render json: @technology_description
      end

      # POST /procedure_requests/:procedure_request_id/technology_descriptions
      def create
        @technology_description = @procedure_request.create_technology_description(technology_description_params_new)

        if @technology_description.save
          render json: @technology_description, status: :created
        else
          render json: @technology_description.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /technology_descriptions/1
      def update
        if @technology_description.update(technology_description_params_update)
          render json: @technology_description
        else
          render json: @technology_description.errors, status: :unprocessable_entity
        end
      end

      # PUT /technology_descriptions/:id/active
      def change_active
        if @technology_description.update(technology_description_params_to_deactivate)
          render json: @technology_description
        else
          render json: @technology_description.errors, status: :unprocessable_entity
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_technology_description
          @technology_description = TechnologyDescription.find(params[:id])
        end 
        def set_procedure_request
          @procedure_request = ProcedureRequest.find(params[:procedure_request_id])
        end
        # Only allow a trusted parameter "white list" through.
        def technology_description_params_new
          params.require(:technology_description).permit(:denomination, :product_or_process_features, :artistic_representation, :key_words, :procedure_request_id, :created_by,)
        end
        def technology_description_params_update
          params.require(:technology_description).permit(:denomination, :product_or_process_features, :artistic_representation, :key_words, :updated_by,)
        end
        def technology_description_params_to_deactivate
          params.require(:technology_description).permit(:active, :updated_by)
        end 
    end
  end
end