module Api
  module V1  
    class TaskAttributesController < ApplicationController
      include Swagger::TaskAttributeApi
      before_action :set_task_model, only: [:index, :create]
      before_action :set_task_attribute, only: [:show, :update, :change_active]

      # GET task_models/{task_model_id}/task_attributes
      def index
        @task_attributes = @task_model.task_attributes

        render json: @task_attributes
      end

      # GET /task_attributes/{id}
      def show
        render json: @task_attribute
      end

      # POST task_models/{task_model_id}/task_attributes
      def create
        @task_attribute = @task_model.task_attributes.new(task_attribute_params_new)

        if @task_attribute.save
          render json: @task_attribute, status: :created
        else
          render json: @task_attribute.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /task_attributes/1
      def update
        if @task_attribute.update(task_attribute_params_update)
          render json: @task_attribute
        else
          render json: @task_attribute.errors, status: :unprocessable_entity
        end
      end

      # PUT /task_attributes/:id/active
      def change_active
        if @task_attribute.update(task_attribute_params_to_deactivate)
          render json: @task_attribute
        else
          render json: @task_attribute.errors, status: :unprocessable_entity
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_task_attribute
          @task_attribute = TaskAttribute.find(params[:id])
        end

        def set_task_model
          @task_model = TaskModel.find(params[:task_model_id])
        end

        # Only allow a trusted parameter "white list" through.
        def task_attribute_params_new
          params.require(:task_attribute).permit(:attribute_sub_type_id, :task_model_id, :created_by)
        end
        def task_attribute_params_update
          params.require(:task_attribute).permit(:attribute_sub_type_id, :task_model_id, :updated_by)
        end
        def task_attribute_params_to_deactivate
          params.require(:task_attribute).permit(:active, :updated_by)
        end
    end
  end
end
