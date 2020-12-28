# app/controllers/api/v1/research_unit_controller.rb
module Api
  module V1
    class ResearchUnitController < ApplicationController
      before_action :set_research_unit, only: [:show, :attach]

      def index
        # docs = ['cidc_act_document', 'faculty_act_document', 'establishment_document']
        docs = []
        @items = DxService.load(ResearchUnit, params, docs)
        render json: @items
      end

      def show
        render json: @items
      end

      # Handling of database exceptions
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      rescue_from ActiveRecord::StatementInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end
    end
  end
end
