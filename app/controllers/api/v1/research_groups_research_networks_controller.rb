module Api
  module V1
    class ResearchGroupsResearchNetworksController < ApplicationController
      include Swagger::RgResearchNetworkApi

      before_action :set_research_network, only: [:index, :create]
      before_action :set_groups_research_network, only: [:show, :update]

      # GET /research_networks/:research_network_id/research_groups_research_networks
      def index
        @groups_research_networks = CompleteRgResearchNetwork.where(
          "research_network_id = ?",
          params[:research_network_id]
        )
        @groups_research_networks = DxService.load(@groups_research_networks, params)

        render json: @groups_research_networks
      end

      # GET /research_groups_research_networks/1
      def show
        render json: @groups_research_network
      end

      # POST /research_networks/:research_network_id/research_groups_research_networks
      def create
        @groups_research_network = @research_network.research_groups_research_networks.new(
          groups_rn_params_to_create)

        if @groups_research_network.save
          render json: @groups_research_network, status: :created
        else
          render json: @groups_research_network.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_groups_research_networks/1
      def update
        if @groups_research_network.update(groups_rn_params_to_update)
          render json: @groups_research_network
        else
          render json: @groups_research_network.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_groups_research_network
        @groups_research_network = ResearchGroupsResearchNetwork.find(params[:id])
      end

      def set_research_network
        @research_network = ResearchNetwork.find(params[:research_network_id])
      end

      # Only allow a trusted parameter "white list" through.
      def groups_rn_params_to_create
        params.require(:research_groups_research_network).permit(:research_group_id,
                                                                 :has_expiration,
                                                                 :expiration_date,
                                                                 :active,
                                                                 :created_by)
      end

      def groups_rn_params_to_update
        params.require(:research_groups_research_network).permit(:research_group_id,
                                                                 :research_network_id,
                                                                 :has_expiration,
                                                                 :expiration_date,
                                                                 :active,
                                                                 :updated_by)
      end
    end
  end
end