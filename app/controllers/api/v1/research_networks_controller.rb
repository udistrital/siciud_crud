module Api
  module V1
    class ResearchNetworksController < ApplicationController
      include Swagger::ResearchNetworkApi

      before_action :set_research_network, only: [:show, :update]

      # GET /research_networks
      def index
        @research_networks = CompleteResearchNetwork.all
        @research_networks = DxService.load(@research_networks, params)
        render json: @research_networks
      end

      # GET /research_networks/1
      def show
        render json: @research_network
      end

      # POST /research_networks
      def create
        @research_network = ResearchNetwork.new(r_network_params_to_create)

        if @research_network.save
          render json: @research_network, status: :created
        else
          render json: @research_network.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_networks/1
      def update
        if @research_network.update(r_network_params_to_update)
          render json: @research_network
        else
          render json: @research_network.errors, status: :unprocessable_entity
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_research_network
        @research_network = ResearchNetwork.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def r_network_params_to_create
        params.require(:research_network).permit(:name, :acronym,
                                                 :request_date, :mission,
                                                 :vision, :advantage,
                                                 :researcher_id,
                                                 :main_research_group_id,
                                                 :network_type_id,
                                                 :cine_broad_area_id,
                                                 :cine_specific_area_id,
                                                 :oecd_knowledge_subarea_id,
                                                 :oecd_knowledge_area_id,
                                                 :academic_responsibilities,
                                                 :financial_responsibilities,
                                                 :legal_responsibilities,
                                                 :active, :created_by,
                                                 cine_detailed_area_ids: [],
                                                 snies_ids: [],
                                                 faculty_ids: [],
                                                 research_focus_ids: [],
                                                 oecd_discipline_ids: [],
                                                 research_group_ids: []
                                                 )
      end

      def r_network_params_to_update
        params.require(:research_network).permit(:name, :acronym,
                                                 :request_date, :mission,
                                                 :vision, :advantage,
                                                 :researcher_id,
                                                 :main_research_group_id,
                                                 :network_type_id,
                                                 :cine_broad_area_id,
                                                 :cine_specific_area_id,
                                                 :oecd_knowledge_subarea_id,
                                                 :oecd_knowledge_area_id,
                                                 :academic_responsibilities,
                                                 :financial_responsibilities,
                                                 :legal_responsibilities,
                                                 :active, :updated_by,
                                                 cine_detailed_area_ids: [],
                                                 snies_ids: [],
                                                 faculty_ids: [],
                                                 research_focus_ids: [],
                                                 oecd_discipline_ids: [],
                                                 research_group_ids: []
        )
      end
    end
  end
end