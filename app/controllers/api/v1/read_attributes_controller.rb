module Api
  module V1  
    class ReadAttributesController < ApplicationController
      include Swagger::ReadAttributeApi
      before_action :set_task_model, only: [:index, :create]
      before_action :set_read_attribute, only: [:show, :update]

      # GET task_models/{task_model_id}/read_attributes
      def index
        @read_attributes = @task_model.read_attributes
        render json: @read_attributes
      end

      # GET /read_attributes/1
      def show
        render json: @read_attribute
      end

      # POST /read_attributes
      def create
        @read_attribute = @task_model.read_attributes.new(read_attribute_params_new)

        if @read_attribute.save
          render json: @read_attribute, status: :created
        else
          render json: @read_attribute.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /read_attributes/1
      def update
        if @read_attribute.update(read_attribute_params_update)
          render json: @read_attribute
        else
          render json: @read_attribute.errors, status: :unprocessable_entity
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_read_attribute
          @read_attribute = ReadAttribute.find(params[:id])
        end
        def set_task_model
          @task_model = TaskModel.find(params[:task_model_id])
        end

        # Only allow a trusted parameter "white list" through.
        def read_attribute_params_new
          params.require(:read_attribute).permit(:task_attribute_id,  :created_by)
        end
        def read_attribute_params_update
          params.require(:read_attribute).permit(:task_attribute_id,  :updated_by)
        end
    end
  end
end
