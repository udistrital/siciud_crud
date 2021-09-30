module Api
  module V1
    class ResearchNetworksController < ApplicationController
      before_action :set_research_network, only: [:show, :update]

      # GET /research_networks
      def index
        @research_networks = ResearchNetwork.all

        render json: @research_networks
      end

      # GET /research_networks/1
      def show
        render json: @research_network
      end

      # POST /research_networks
      def create
        @research_network = ResearchNetwork.new(research_network_params)

        if @research_network.save
          render json: @research_network, status: :created
        else
          render json: @research_network.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_networks/1
      def update
        if @research_network.update(research_network_params)
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
      def research_network_params
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
                                                 :active, :created_by, :updated_by)
      end
    end
  end
end