module Api
  module V1
    class ProceduresController < ApplicationController
      include Swagger::ProcedureApi
      before_action :set_procedure, only: [:show, :update]

      # Lista los procedimientos a los cuales se le pueden asignar tareas en el model_task
      def index
        @procedures = Procedure.all

        render json: @procedures
      end

      def show
        render json: @procedure
      end

      # POST /procedures
      def create
        @procedure = Procedure.new(procedure_params_to_new)

        if @procedure.save
          render json: @procedure, status: :created
        else
          render json: @procedure.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /procedures/1
      def update
        if @procedure.update(procedure_params_to_update)
          render json: @procedure
        else
          render json: @procedure.errors, status: :unprocessable_entity
        end
      end

      private
        def procedure_params_to_new
          params.require(:procedure).permit(:name, :created_by)
        end
        def procedure_params_to_update
          params.require(:procedure).permit(:name, :updated_by)
        end
        # Use callbacks to share common setup or constraints between actions.
        def set_procedure
          @procedure = Procedure.find(params[:id])
        end
    end
  end
end
