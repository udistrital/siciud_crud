module Api
  module V1
    class HistLegalRepresentativesController < ApplicationController
      include Swagger::HistLegalRepresentativeApi

      before_action :set_entity, only: [:index, :create]
      before_action :set_hist_legal_representative, only: [:show, :update]

      # GET /entities/:id/hist_legal_representatives
      def index
        @hist_legal_representatives = HistLegalRepresentative.all
        @hist_legal_representatives = DxService.load(@hist_legal_representatives,
                                                     params)
        render json: @hist_legal_representatives
      end

      # GET /hist_legal_representatives/1
      def show
        render json: @hist_legal_representative
      end

      # POST /entities/:id/hist_legal_representatives
      def create
        @hist_legal_representative = HistLegalRepresentative.new(
          hist_lr_params_to_create)

        if @hist_legal_representative.save
          render json: @hist_legal_representative, status: :created
        else
          render json: @hist_legal_representative.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /hist_legal_representatives/1
      def update
        if @hist_legal_representative.update(hist_lr_params_to_update)
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

      def set_entity
        @entity = Entity.find(params[:entity_id])
      end

      # Only allow a trusted parameter "white list" through.
      def hist_lr_params_to_create
        params.require(:hist_legal_representative).permit(:legal_representative_id,
                                                          :is_current,
                                                          :active, :created_by)
      end

      def hist_lr_params_to_update
        params.require(:hist_legal_representative).permit(:legal_representative_id,
                                                          :entity_id, :is_current,
                                                          :active, :updated_by)
      end
    end
  end
end