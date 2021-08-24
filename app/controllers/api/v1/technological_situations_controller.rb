module Api
  module V1    
    class TechnologicalSituationsController < ApplicationController
      include Swagger::TechnologicalSituationApi
      before_action :set_technological_situation, only: [:show, :update, :change_active]
      before_action :set_procedure_request, only: [:index, :create]

      # GET /procedure_requests/:procedure_request_id/technological_situations
      def index
        @technological_situations = @procedure_request.technological_situation

        render json: @technological_situations
      end

      # GET /technological_situations/1
      def show
        render json: @technological_situation
      end

      # POST /procedure_requests/:procedure_request_id/technological_situations
      def create
        @technological_situation = @procedure_request.create_technological_situation(technological_situation_params_new)

        if @technological_situation.save
          render json: @technological_situation, status: :created
        else
          render json: @technological_situation.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /technological_situations/1
      def update
        if @technological_situation.update(technological_situation_params_update)
          render json: @technological_situation
        else
          render json: @technological_situation.errors, status: :unprocessable_entity
        end
      end

      # PUT /technological_situations/:id/active
      def change_active
        if @technological_situation.update(technological_situation_params_to_deactivate)
          render json: @technological_situation
        else
          render json: @technological_situation.errors, status: :unprocessable_entity
        end
      end
      
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_technological_situation
          @technological_situation = TechnologicalSituation.find(params[:id])
        end
        def set_procedure_request
          @procedure_request = ProcedureRequest.find(params[:procedure_request_id])
        end
        # Only allow a trusted parameter "white list" through.
        def technological_situation_params_new
          params.require(:technological_situation).permit(:invention_type_id, :required_equipment, :pending_development, :differential_factors, :pi_requested, :media_spread, :channel_spread, :spread_plans, :procedure_request_id, :created_by, development_stage_ids:[],technology_reason_ids:[])
        end
        def technological_situation_params_update
          params.require(:technological_situation).permit(:invention_type_id, :required_equipment, :pending_development, :differential_factors, :pi_requested, :media_spread, :channel_spread, :spread_plans, :updated_by, development_stage_ids:[],technology_reason_ids:[])
        end
        def technological_situation_params_to_deactivate
          params.require(:technological_situation).permit(:active, :updated_by)
        end 
    end
  end
end
