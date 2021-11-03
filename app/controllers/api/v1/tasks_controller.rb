module Api
  module V1    
    class TasksController < ApplicationController
      include Swagger::TaskApi
      before_action :set_task, only: [:show, :update, :change_active]
      before_action :set_request_has_procedure, only: [:index, :create]

      # GET /request_has_procedures/:request_has_procedure_id/tasks
      def index
        @tasks = @request_has_procedure.tasks

        render json: @tasks
      end

      # GET /tasks/1
      def show
        render json: @task
      end

      # POST /request_has_procedures/:request_has_procedure_id/tasks
      def create
        @task = @request_has_procedure.tasks.new(task_params_new)

        if @task.save
          render json: @task, status: :created
        else
          render json: @task.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /tasks/1
      def update
        if @task.update(task_params_update)
          render json: @task
        else
          render json: @task.errors, status: :unprocessable_entity
        end
      end

      # PUT /tasks/:id/active
      def change_active
        if @task.update(task_params_to_deactivate)
          render json: @task
        else
          render json: @task.errors, status: :unprocessable_entity
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_task
          @task = Task.find(params[:id])
        end

        def set_request_has_procedure
          @request_has_procedure = RequestHasProcedure.find(params[:request_has_procedure_id])
        end

        # Only allow a trusted parameter "white list" through.
        def task_params_new
          params.require(:task).permit(:otri_professional_id, :task_model_id, :expired_date, :created_by)
        end
        def task_params_update
          params.require(:task).permit(:intelectual_property_id, :desition, :updated_by)
        end
        def task_params_to_deactivate
          params.require(:task).permit(:active, :updated_by)
        end
    end
  end
end
