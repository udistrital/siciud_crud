module Api
  module V1
    class AffiliatedEntitiesController < ApplicationController
      include Swagger::AffiliatedEntityApi

      before_action :set_research_network, only: [:create]
      before_action :set_affiliated_entity, only: [:show, :update]

      # GET /affiliated_entities
      def index
        if params[:research_network_id]
          @affiliated_entities = CompleteAffiliatedEntity.where(
            "research_network_id = ?", params[:research_network_id]
          )
        else
          @affiliated_entities = CompleteAffiliatedEntity.all
        end
        @affiliated_entities = DxService.load(@affiliated_entities, params)
        render json: @affiliated_entities
      end

      # GET /affiliated_entities/1
      def show
        render json: @affiliated_entity
      end

      # POST /affiliated_entities
      def create
        @affiliated_entity = @research_network.affiliated_entities.new(
          aff_ent_params_to_create)

        if @affiliated_entity.save
          render json: @affiliated_entity, status: :created
        else
          render json: @affiliated_entity.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /affiliated_entities/1
      def update
        if @affiliated_entity.update(aff_ent_params_to_update)
          render json: @affiliated_entity
        else
          render json: @affiliated_entity.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_affiliated_entity
        @affiliated_entity = AffiliatedEntity.find(params[:id])
      end

      def set_research_network
        @research_network = ResearchNetwork.find(params[:research_network_id])
      end

      # Only allow a trusted parameter "white list" through.
      def aff_ent_params_to_create
        params.require(:affiliated_entity).permit(:research_network_id, :entity_id,
                                                  :institution_type_id, :geo_country_id,
                                                  :active, :created_by)
      end

      def aff_ent_params_to_update
        params.require(:affiliated_entity).permit(:research_network_id, :entity_id,
                                                  :institution_type_id, :geo_country_id,
                                                  :active, :updated_by)
      end
    end
  end
end