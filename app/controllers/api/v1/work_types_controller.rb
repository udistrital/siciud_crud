module Api
  module V1
    class WorkTypesController < ApplicationController
      before_action :set_work_type, only: [:show, :update]

      # Handling of database exceptions
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      # GET /work_types
      def index
        @work_types = WorkType.all

        render json: @work_types
      end

      # GET /work_types/1
      def show
        render json: @work_type
      end

      # POST /work_types
      def create
        @work_type = WorkType.new(work_type_params)

        if @work_type.save
          render json: @work_type, status: :created
        else
          render json: @work_type.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /work_types/1
      def update
        if @work_type.update(work_type_params)
          render json: @work_type
        else
          render json: @work_type.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_work_type
        @work_type = WorkType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def work_type_params
        params.require(:work_type).permit(:name)
      end
    end
  end
end