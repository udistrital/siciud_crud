module Api
  module V1
    class OecdDisciplinesController < ApplicationController
      include Swagger::OecdDisciplineApi

      def index
        @oecd_discipline = OecdDiscipline.all.order(:code)
        render json: @oecd_discipline
      end

      def create
        @oecd_discipline = OecdDiscipline.new(discipline_params)
        if @oecd_discipline.save
          render json: @oecd_discipline, status: :ok
        else
          render json: @oecd_discipline.errors, status: :unprocessable_entity
        end
      end

      def update
        if @oecd_discipline.update(discipline_params)
          render json: @oecd_discipline, status: :ok
        else
          render json: @oecd_discipline.errors, status: :unprocessable_entity
        end
      end

      private

      def discipline_params
        params.require(:oecd_discipline).permit(:name, :code,
                                                :oecd_knowledge_subarea_id)
      end

      def set_discipline

      end
    end
  end
end
