module Api
  module V1
    class LegalRepresentativesController < ApplicationController
      include Swagger::LegalRepresentativeApi

      before_action :set_legal_representative, only: [:show, :update]

      # GET /legal_representatives
      def index
        if params[:identification_number]
          @legal_representatives = LegalRepresentative.where(
            "identification_number = ?",
            params[:identification_number]
          )
        else
          @legal_representatives = LegalRepresentative.all
        end
        @legal_representatives = DxService.load(@legal_representatives, params)
        render json: @legal_representatives
      end

      # GET /legal_representatives/1
      def show
        render json: @legal_representative
      end

      # POST /legal_representatives
      def create
        @legal_representative = LegalRepresentative.new(legal_rep_params_to_create)

        if @legal_representative.save
          render json: @legal_representative, status: :created
        else
          render json: @legal_representative.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /legal_representatives/1
      def update
        if @legal_representative.update(legal_rep_params_to_update)
          render json: @legal_representative
        else
          render json: @legal_representative.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_legal_representative
        @legal_representative = LegalRepresentative.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def legal_rep_params_to_create
        params.require(:legal_representative).permit(:name,
                                                     :email, :identification_number,
                                                     :identification_type_id, :active,
                                                     :created_by)
      end

      def legal_rep_params_to_update
        params.require(:legal_representative).permit(:name,
                                                     :email, :identification_number,
                                                     :identification_type_id, :active,
                                                     :updated_by)
      end
    end

  end
end