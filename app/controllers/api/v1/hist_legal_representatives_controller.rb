module Api
  module V1
    class HistLegalRepresentativesController < ApplicationController
      before_action :set_hist_legal_representative, only: [:show, :update]

      # GET /hist_legal_representatives
      def index
        @hist_legal_representatives = HistLegalRepresentative.all

        render json: @hist_legal_representatives
      end

      # GET /hist_legal_representatives/1
      def show
        render json: @hist_legal_representative
      end

      # POST /hist_legal_representatives
      def create
        @hist_legal_representative = HistLegalRepresentative.new(hist_legal_representative_params)

        if @hist_legal_representative.save
          render json: @hist_legal_representative, status: :created
        else
          render json: @hist_legal_representative.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /hist_legal_representatives/1
      def update
        if @hist_legal_representative.update(hist_legal_representative_params)
          render json: @hist_legal_representative
        else
          render json: @hist_legal_representative.errors, status: :unprocessable_entity
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_hist_legal_representative
        @hist_legal_representative = HistLegalRepresentative.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def hist_legal_representative_params
        params.require(:hist_legal_representative).permit(:legal_representative_id,
                                                          :entity_id, :is_current,
                                                          :active, :created_by, :updated_by)
      end
    end
  end
end