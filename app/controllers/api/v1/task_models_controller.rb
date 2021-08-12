module Api
  module V1    
    class TaskModelsController < ApplicationController
      include Swagger::TaskModelApi
      before_action :set_task_model, only: [:show, :update, :change_active]

      # GET /task_models
      def index
        @task_models = TaskModel.all

        render json: @task_models
      end

      # GET /task_models/1
      def show
        render json: @task_model
      end

      # POST /task_models
      def create
        @task_model = TaskModel.new(task_model_params_new)

        if @task_model.save
          render json: @task_model, status: :created
        else
          render json: @task_model.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /task_models/1
      def update
        if @task_model.update(task_model_params_update)
          render json: @task_model
        else
          render json: @task_model.errors, status: :unprocessable_entity
        end
      end

      # PUT /task_models/:id/active
      def change_active
        if @task_model.update(task_model_params_to_deactivate)
          render json: @task_model
        else
          render json: @task_model.errors, status: :unprocessable_entity
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_task_model
          @task_model = TaskModel.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def task_model_params_new
          params.require(:task_model).permit(:name, :duration, :professional_role_id, :procedure_id, :created_by)
        end
        def task_model_params_update
          params.require(:task_model).permit(:name, :duration, :professional_role_id, :procedure_id, :updated_by)
        end
        def task_model_params_to_deactivate
          params.require(:task_model).permit(:active, :updated_by)
        end
    end
  end
end
