module Api
  module V1
    class SubtypesController < ApplicationController
      include Swagger::SubtypeApi

      before_action :set_type, only: [:index, :show, :create, :update, :change_active]
      before_action :set_subtype, only: [:show, :update, :change_active]
      before_action only: [:change_active] do
        active_in_body_params? subtype_params_to_deactivate
      end

      # GET types/:type_id/subtypes
      def index
        @subtypes = @type.subtypes
        render json: @subtypes
      end

      # GET types/:type_id/subtypes/1
      def show
        render json: @subtype
      end

      # POST types/:type_id/subtypes
      def create
        @subtype = @type.subtypes.new(subtype_params_to_create)

        if @subtype.save
          render json: @subtype, status: :created
        else
          render json: @subtype.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT types/:type_id/subtypes/1
      def update
        if @subtype.update(subtype_params_to_update)
          render json: @subtype
        else
          render json: @subtype.errors, status: :unprocessable_entity
        end
      end

      # PUT types/:type_id/subtypes/1/active
      def change_active
        if @subtype.update(subtype_params_to_deactivate)
          render json: @subtype
        else
          render json: @subtype.errors, status: :unprocessable_entity
        end
      end

      # GET /subtypes
      def all_subtypes
        @subtypes = Subtype.all.order(:id)
        render json: @subtypes
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_type
        @type = Type.find(params[:type_id])
      end

      def set_subtype
        @subtype = @type.subtypes.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def subtype_params_to_create
        params.require(:subtype).permit(:st_name, :st_description, :parent_id, :type_id,
                                        :created_by)
      end

      def subtype_params_to_update
        params.require(:subtype).permit(:st_name, :st_description, :parent_id, :type_id,
                                        :updated_by)
      end

      def subtype_params_to_deactivate
        params.require(:subtype).permit(:active, :updated_by)
      end
    end
  end
end
