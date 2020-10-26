module Api
  module V1
    class PaperTypesController < ApplicationController
      before_action :set_paper_type, only: [:show, :update]

      # Handling of database exceptions
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      # GET /paper_types
      def index
        @paper_types = PaperType.all

        render json: @paper_types
      end

      # GET /paper_types/1
      def show
        render json: @paper_type
      end

      # POST /paper_types
      def create
        @paper_type = PaperType.new(paper_type_params)

        if @paper_type.save
          render json: @paper_type, status: :created
        else
          render json: @paper_type.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /paper_types/1
      def update
        if @paper_type.update(paper_type_params)
          render json: @paper_type
        else
          render json: @paper_type.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_paper_type
        @paper_type = PaperType.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def paper_type_params
        params.require(:paper_type).permit(:name)
      end
    end
  end
end