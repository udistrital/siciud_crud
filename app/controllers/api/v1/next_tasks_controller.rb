module Api
  module V1
    class NextTasksController < ApplicationController
      include Swagger::NextTaskApi
      before_action :set_task_model, only: [:index, :create]
      before_action :set_next_task, only: [:show, :update, :change_active]

      # GET task_models/{task_model_id}/next_tasks
      def index
        @next_tasks = @actual_task_model.actual_tasks

        render json: @next_tasks
      end

      # GET /next_tasks/1
      def show
        render json: @next_task
      end

      # POST task_models/{task_model_id}/next_tasks
      def create
        @next_task = @actual_task_model.actual_tasks.new(next_task_params_new)

        if @next_task.save
          render json: @next_task, status: :created
        else
          render json: @next_task.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /next_tasks/1
      def update
        if @next_task.update(next_task_params_update)
          render json: @next_task
        else
          render json: @next_task.errors, status: :unprocessable_entity
        end
      end

      # PUT /next_tasks/:id/active
      def change_active
        if @next_task.update(next_task_params_to_deactivate)
          render json: @next_task
        else
          render json: @next_task.errors, status: :unprocessable_entity
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_next_task
          @next_task = NextTask.find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def next_task_params_new
          params.require(:next_task).permit(:actual_task_id, :following_task_id, :created_by)
        end
        def next_task_params_update
          params.require(:next_task).permit( :following_task_id, :updated_by)
        end
        def next_task_params_to_deactivate
          params.require(:next_task).permit(:active, :updated_by)
        end
         # Use callbacks to share common setup or constraints between actions.
         def set_task_model
          @actual_task_model = TaskModel.find(params[:task_model_id])
        end
    end
  end
end
