module Api
  module V1
    class ScientificCollectionsController < AbstractProductResearchUnitController
      include Swagger::ScientificCollectionApi

      before_action :set_research_group, only: [:index, :create]
      before_action :set_scientific_collection, only: [:show, :update]

      # GET /research_units/:id/scientific_collections
      def index
        @scientific_collections = CompleteScientificCollection.where(
          research_group_id: params[:research_group_id])
        @scientific_collections = DxService.load(@scientific_collections, params)

        render json: @scientific_collections
      end

      # GET /scientific_collections/1
      def show
        render json: @scientific_collection
      end

      # POST /research_units/:id/scientific_collections
      def create
        @scientific_collection = @research_group.scientific_collections.new(sc_coll_params_to_create)

        if @scientific_collection.save
          render json: @scientific_collection, status: :created
        else
          render json: @scientific_collection.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /scientific_collections/1
      def update
        if @scientific_collection.update(sc_coll_params_to_update)
          render json: @scientific_collection
        else
          render json: @scientific_collection.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_scientific_collection
        @scientific_collection = ScientificCollection.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def sc_coll_params_to_create
        params.require(:scientific_collection).permit(:name, :date_of_obtaining,
                                                      :managing_institution_name, :curator_name,
                                                      :last_conservatorship_date, :validity_and_use,
                                                      :information_included, :geo_city_id, :geo_state_id,
                                                      :geo_country_id, :category_id,
                                                      :research_group_id, :colciencias_call_id, :observation,
                                                      :active, :created_by)
      end

      def sc_coll_params_to_update
        params.require(:scientific_collection).permit(:name, :date_of_obtaining,
                                                      :managing_institution_name, :curator_name,
                                                      :last_conservatorship_date, :validity_and_use,
                                                      :information_included, :geo_city_id, :geo_state_id,
                                                      :geo_country_id, :category_id,
                                                      :research_group_id, :colciencias_call_id, :observation,
                                                      :active, :updated_by)
      end
    end
  end
end