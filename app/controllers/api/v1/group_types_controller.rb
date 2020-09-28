module Api
  module V1
    class GroupTypesController < ApplicationController
      before_action :set_group_type, only: [:show, :update]

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      # GET /group_types
      def index
        @group_types = GroupType.all

        render json: @group_types
      end

      # POST /group_types
      def create
        @group_type = GroupType.new(group_type_params)

        if @group_type.save
          render json: @group_type, status: :created, location: @group_type
        else
          render json: @group_type.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /group_types/id
      def update
        if @group_type.update(group_type_params)
          render json: @group_type
        else
          render json: @group_type.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_group_type
        @group_type = GroupType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def group_type_params
        params.require(:group_type).permit(:name)
      end
    end

  end
end