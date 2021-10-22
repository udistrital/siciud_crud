module Api
  module V1  
    class TaskHasStatesController < ApplicationController
      include Swagger::TaskHasStateApi
      before_action :set_task_has_state, only: [:show, :change_active]
      before_action :set_task, only: [:index, :create]

      # GET /task_has_states
      def index
        @task_has_states = @task.task_has_states

        render json: @task_has_states
      end

      # GET /task_has_states/1
      def show
        render json: @task_has_state
      end

      # POST /task_has_states
      def create
        @task_has_state = @task.task_has_states.new(task_has_state_params_new)

        if @task_has_state.save
          render json: @task_has_state, status: :created
        else
          render json: @task_has_state.errors, status: :unprocessable_entity
        end
      end

      # PUT /task_models/:id/active
      def change_active
        if @task_has_state.update(task_has_state_params_to_deactivate)
          render json: @task_has_state
        else
          render json: @task_has_state.errors, status: :unprocessable_entity
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_task_has_state
          @task_has_state = TaskHasState.find(params[:id])
        end
        def set_task
          @task = Task.find(params[:task_id])
        end
        # Only allow a trusted parameter "white list" through.
        def task_has_state_params_new
          params.require(:task_has_state).permit(:state_id, :created_by)
        end
        def task_has_state_params_to_deactivate
          params.require(:task_has_state).permit(:active, :updated_by)
        end
    end
  end
end
