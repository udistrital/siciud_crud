module Api
  module V1
    class OecdKnowledgeAreasController < ApplicationController
      before_action :set_knowledge_area, only: [:update]

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      def index
        @oecd_knowledge_area = OecdKnowledgeArea.all.order(:code)
        render json: @oecd_knowledge_area
      end

      def create
        @oecd_knowledge_area = OecdKnowledgeArea.new(knowledge_area_params)

        if @oecd_knowledge_area.save
          render json: @oecd_knowledge_area, status: :created
        else
          render json: @oecd_knowledge_area.errors, status: :unprocessable_entity
        end
      end

      def update
        if @oecd_knowledge_area.update(knowledge_area_params)
          render json: @oecd_knowledge_area, status: :ok
        else
          render json: @oecd_knowledge_area.errors, status: :unprocessable_entity
        end
      end

      private

      def knowledge_area_params
        params.require(:oecd_knowledge_area).permit(:name, :code)
      end

      def set_knowledge_area
        @oecd_knowledge_area = OecdKnowledgeArea.find(params[:id])
      end
    end
  end
end