module Api
  module V1
    class SubtypesController < ApplicationController
      before_action :set_type, only: [:index, :show, :update, :change_active]
      before_action :set_subtype, only: [:index, :show, :update, :change_active]
      before_action only: [:change_active] do
        active_in_body_params? subtype_params_to_deactivate
      end

      # GET /subtypes_all
      def subtypes_all
        @items = Subtype.all.order(:id)
        render json: @items
      end

      # GET /subtypes
      def index
        @subtypes = @type.subtypes
        render json: @subtypes
      end

      # GET /subtypes/1
      def show
        render json: @subtype
      end

      # POST /subtypes
      def create
        @subtype = @type.subtypes.new(subtype_params_to_create)

        if @subtype.save
          render json: @subtype, status: :created
        else
          render json: @subtype.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /subtypes/1
      def update
        if @subtype.update(subtype_params_to_update)
          render json: @subtype
        else
          render json: @subtype.errors, status: :unprocessable_entity
        end
      end

      # PUT /subtypes/1/active
      def change_active
        if @subtype.update(subtype_params_to_deactivate)
          render json: @subtype
        else
          render json: @subtype.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_type
        @type = Type.find(params[:type_id])
      end

      def set_subtype
        @subtype = Subtype.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def subtype_params_to_create
        params.require(:subtype).permit(:st_name, :st_description, :parent_id,
                                        :created_by)
      end

      def subtype_params_to_update
        params.require(:subtype).permit(:st_name, :st_description, :parent_id,
                                        :updated_by)
      end

      def subtype_params_to_deactivate
        params.require(:subtype).permit(:active, :updated_by)
      end
    end
  end
end
