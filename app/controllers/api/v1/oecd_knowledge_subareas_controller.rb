module Api
  module V1
    class OecdKnowledgeSubareasController < ApplicationController
      before_action :set_knowledge_subarea, only: [:update]

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      def index
        @oecd_knowledge_subarea = OecdKnowledgeSubarea.all.order(:code)
        render json: @oecd_knowledge_subarea
      end

      def create
        @oecd_knowledge_subarea = OecdKnowledgeSubarea.new(knowledge_subarea_params)

        if @oecd_knowledge_subarea.save
          render json: @oecd_knowledge_subarea, status: :ok
        else
          render json: @oecd_knowledge_subarea.errors, status: :unprocessable_entity
        end
      end

      def update
        if @oecd_knowledge_subarea.update(knowledge_subarea_params)
          render json: @oecd_knowledge_subarea, status: :ok
        else
          render json: @oecd_knowledge_subarea.errors, status: :unprocessable_entity
        end
      end

      private

      def knowledge_subarea_params
        params.require(:oecd_knowledge_subarea).permit(:name, :code,
                                                    :oecd_knowledge_area_id)
      end

      def set_knowledge_subarea
        @oecd_knowledge_area = OecdKnowledgeSubarea.find(params[:id])
      end
    end
  end
end
