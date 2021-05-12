module Api
  module V1
    class EnterpriseSecretsController < AbstractProductResearchUnitController
      include Swagger::EnterpriseSecretApi

      before_action :set_research_group, only: [:index, :create]
      before_action :set_enterprise_secret, only: [:show, :update]

      # GET /research_units/:id/enterprise_secrets
      def index
        @enterprise_secrets = CompleteEnterpriseSecret.where(
          research_group_id: params[:research_group_id])
        @enterprise_secrets = DxService.load(@enterprise_secrets, params)

        render json: @enterprise_secrets
      end

      # GET /enterprise_secrets/1
      def show
        render json: @enterprise_secret
      end

      # POST /research_units/:id/enterprise_secrets
      def create
        @enterprise_secret = @research_group.enterprise_secrets.new(
          ent_secret_params_to_create)

        if @enterprise_secret.save
          render json: @enterprise_secret, status: :created
        else
          render json: @enterprise_secret.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /enterprise_secrets/1
      def update
        if @enterprise_secret.update(ent_secret_params_to_update)
          render json: @enterprise_secret
        else
          render json: @enterprise_secret.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_enterprise_secret
        @enterprise_secret = EnterpriseSecret.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def ent_secret_params_to_create
        params.require(:enterprise_secret).permit(:name, :contract_number, :contract_value,
                                                  :date_of_obtaining, :geo_city_id, :category_id,
                                                  :research_group_id, :colciencias_call_id,
                                                  :observation,
                                                  :active, :created_by)
      end

      def ent_secret_params_to_update
        params.require(:enterprise_secret).permit(:name, :contract_number, :contract_value,
                                                  :date_of_obtaining, :geo_city_id, :category_id,
                                                  :research_group_id, :colciencias_call_id,
                                                  :observation,
                                                  :active, :updated_by)
      end
    end
  end
end