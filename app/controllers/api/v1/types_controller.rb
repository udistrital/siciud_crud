module Api
  module V1
    class TypesController < ApplicationController
      include Swagger::TypeApi

      before_action :set_type, only: [:show, :update]

      # GET /types
      def index
        @types = Type.all
        # @types = DxService.load(@types, params)
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

      # GET /types_all
      def all_types_and_subtypes
        @types = CompleteType.all
        @types = DxService.load(@types, params)
        render json: @types
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_type
        @type = Type.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def type_params_to_create
        params.require(:type).permit(:t_name, :t_description,
                                     :active, :created_by)
      end

      def type_params_to_update
        params.require(:type).permit(:t_name, :t_description,
                                     :active, :updated_by)
      end
    end
  end
end