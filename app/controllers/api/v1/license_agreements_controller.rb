module Api
  module V1
    class LicenseAgreementsController < AbstractProductResearchUnitController
      include Swagger::LicenseAgreementApi

      before_action :set_research_group, only: [:index, :create]
      before_action :set_license_agreement, only: [:show, :update]

      # GET /research_units/:id/license_agreements
      def index
        @license_agreements = CompleteLicenseAgreement.where(
          research_group_id: params[:research_group_id])
        @license_agreements = DxService.load(@license_agreements, params)

        render json: @license_agreements
      end

      # GET /license_agreements/1
      def show
        render json: @license_agreement
      end

      # POST /research_units/:id/license_agreements
      def create
        @license_agreement = @research_group.license_agreements.new(
          license_agr_params_to_create)

        if @license_agreement.save
          render json: @license_agreement, status: :created
        else
          render json: @license_agreement.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /license_agreements/1
      def update
        if @license_agreement.update(license_agr_params_to_update)
          render json: @license_agreement
        else
          render json: @license_agreement.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_license_agreement
        @license_agreement = LicenseAgreement.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def license_agr_params_to_create
        params.require(:license_agreement).permit(:work_name, :license_grant_date, :contract_date,
                                                  :ncd_registry_number, :license_owner_institution,
                                                  :geo_city_id, :contract_geo_city_id, :category_id,
                                                  :research_group_id, :colciencias_call_id,
                                                  :observation, :active, :created_by)
      end

      def license_agr_params_to_update
        params.require(:license_agreement).permit(:work_name, :license_grant_date, :contract_date,
                                                  :ncd_registry_number, :license_owner_institution,
                                                  :geo_city_id, :contract_geo_city_id, :category_id,
                                                  :research_group_id, :colciencias_call_id,
                                                  :observation, :active, :updated_by)
      end
    end
  end
end