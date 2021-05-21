module Api
  module V1
    class HistoricalColcienciasRanksController < ApplicationController
      include Swagger::HistoricalColcienciasRankApi

      before_action :set_research_group
      before_action :set_historical_colc_rank, only: [:show, :update]

      def index
        @historical_colciencias_rank = @research_group.historical_colciencias_ranks
        render json: @historical_colciencias_rank, status: :ok
      end

      def show
        render json: @historical_colciencias_rank
      end

      def create
        @historical_colciencias_rank = @research_group.historical_colciencias_ranks.new(
          hist_colc_params_to_create)
        if @historical_colciencias_rank.save
          render json: @historical_colciencias_rank, status: :created
        else
          render json: @historical_colciencias_rank.errors, status: :unprocessable_entity
        end
      end

      def update
        if @historical_colciencias_rank.update(hist_colc_params_to_update)
          render json: @historical_colciencias_rank, status: :ok
        else
          render json: @historical_colciencias_rank.errors, status: :unprocessable_entity
        end
      end

      private

      def hist_colc_params_to_create
        params.require(:historical_colciencias_rank).permit(:colciencias_call_id,
                                                            :colciencias_category_id,
                                                            :oecd_knowledge_area_id,
                                                            :oecd_knowledge_subarea_id,
                                                            :created_by)
      end

      def hist_colc_params_to_update
        params.require(:historical_colciencias_rank).permit(:colciencias_call_id,
                                                            :colciencias_category_id,
                                                            :oecd_knowledge_area_id,
                                                            :oecd_knowledge_subarea_id,
                                                            :updated_by)
      end

      def set_research_group
        @research_group = ResearchGroup.find_by(id: params["research_group_id"])
      end

      def set_historical_colc_rank
        @historical_colciencias_rank = @research_group.historical_colciencias_ranks.find_by(id: params[:id])
        unless @historical_colciencias_rank
          render json: { error: "Couldn't find historical colciencias rank with 'id'=#{params["id"]}" }
        end
      end
    end
  end
end
