module Api
  module V1
    class EnterprisesController < AbstractProductResearchUnitController
      include Swagger::EnterpriseApi

      before_action :set_research_group, only: [:index, :create]
      before_action :set_enterprise, only: [:show, :update]

      # GET /research_units/:id/enterprises
      def index
        @enterprises = CompleteEnterprise.where(
          research_group_id: params[:research_group_id])
        @enterprises = DxService.load(@enterprises, params)

        render json: @enterprises
      end

      # GET /enterprises/1
      def show
        render json: @enterprise
      end

      # POST /research_units/:id/enterprises
      def create
        @enterprise = @research_group.enterprises.new(enterprise_params_to_create)

        if @enterprise.save
          render json: @enterprise, status: :created
        else
          render json: @enterprise.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /enterprises/1
      def update
        if @enterprise.update(enterprise_params_to_update)
          render json: @enterprise
        else
          render json: @enterprise.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_enterprise
        @enterprise = Enterprise.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def enterprise_params_to_create
        params.require(:enterprise).permit(:name, :nit, :comercial_name, :date_of_obtaining,
                                           :product_type_id, :geo_city_id, :category_id,
                                           :research_group_id, :colciencias_call_id,
                                           :observation, :active, :created_by)
      end

      def enterprise_params_to_update
        params.require(:enterprise).permit(:name, :nit, :comercial_name, :date_of_obtaining,
                                           :product_type_id, :geo_city_id, :category_id,
                                           :research_group_id, :colciencias_call_id,
                                           :observation, :active, :updated_by)
      end
    end
  end
end