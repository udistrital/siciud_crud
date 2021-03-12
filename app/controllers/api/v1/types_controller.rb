module Api
  module V1
    class TypesController < ApplicationController
      before_action :set_type, only: [:show, :update, :change_active]
      before_action only: [:change_active] do
        active_in_body_params? type_params_to_deactivate
      end

      # GET /types
      def index
        @types = Type.all
        @types = DxService.load(@types, params)

        render json: @types
      end

      # GET /types/1
      def show
        render json: @type
      end

      # POST /types
      def create
        @type = Type.new(type_params_to_create)

        if @type.save
          render json: @type, status: :created
        else
          render json: @type.errors, status: :unprocessable_entity
        end
      end

      # PUT /types/1
      def update
        if @type.update(type_params_to_update)
          render json: @type
        else
          render json: @type.errors, status: :unprocessable_entity
        end
      end

      # PUT /types/1/active
      def change_active
        if @type.update(type_params_to_deactivate)
          render json: @type
        else
          render json: @type.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_type
        @type = Type.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def type_params_to_create
        params.require(:type).permit(:t_name, :t_description, :created_by)
      end

      def type_params_to_update
        params.require(:type).permit(:t_name, :t_description, :updated_by)
      end

      def type_params_to_deactivate
        params.require(:type).permit(:active, :updated_by)
      end
    end
  end
end