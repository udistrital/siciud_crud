module Api
  module V1
    class KnowledgeNetworksController < AbstractProductResearchUnitController
      include Swagger::KnowledgeNetworkApi

      before_action :set_research_group, only: [:index, :create]
      before_action :set_knowledge_network, only: [:show, :update]

      # GET /research_units/:id/knowledge_networks
      def index
        @knowledge_networks = CompleteKnowledgeNetwork.where(
          research_group_id: params[:research_group_id])
        @knowledge_networks = DxService.load(@knowledge_networks, params)

        render json: @knowledge_networks
      end

      # GET /knowledge_networks/1
      def show
        render json: @knowledge_network
      end

      # POST /research_units/:id/knowledge_networks
      def create
        @knowledge_network = @research_group.knowledge_networks.new(
          knwl_network_params_to_create)

        if @knowledge_network.save
          render json: @knowledge_network, status: :created
        else
          render json: @knowledge_network.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /knowledge_networks/1
      def update
        if @knowledge_network.update(knwl_network_params_to_update)
          render json: @knowledge_network
        else
          render json: @knowledge_network.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_knowledge_network
        @knowledge_network = KnowledgeNetwork.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def knwl_network_params_to_create
        params.require(:knowledge_network).permit(:name, :start_date, :finish_date,
                                                  :funding_institution, :funding_community,
                                                  :web_page, :geo_city_id, :category_id,
                                                  :research_group_id, :colciencias_call_id,
                                                  :observation, :active, :created_by)
      end

      def knwl_network_params_to_update
        params.require(:knowledge_network).permit(:name, :start_date, :finish_date,
                                                  :funding_institution, :funding_community,
                                                  :web_page, :geo_city_id, :category_id,
                                                  :research_group_id, :colciencias_call_id,
                                                  :observation, :active, :updated_by)
      end
    end
  end
end