module Api
  module V1
    class NonSpecializedPublicationsController < AbstractProductResearchUnitController
      include Swagger::NonSpecializedPublicationApi

      before_action :set_research_group, only: [:index, :create]
      before_action :set_non_specialized_publication, only: [:show, :update]

      # GET /research_units/:id/non_specialized_publications
      def index
        @non_specialized_publications = CompleteNonSpcPub.where(
          research_group_id: params[:research_group_id])
        @non_specialized_publications = DxService.load(@non_specialized_publications, params)

        render json: @non_specialized_publications
      end

      # GET /non_specialized_publications/1
      def show
        render json: @non_specialized_publication
      end

      # POST /research_units/:id/non_specialized_publications
      def create
        @non_specialized_publication = @research_group.non_specialized_publications.new(
          non_spc_pub_params_to_create)

        if @non_specialized_publication.save
          render json: @non_specialized_publication, status: :created
        else
          render json: @non_specialized_publication.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /non_specialized_publications/1
      def update
        if @non_specialized_publication.update(non_spc_pub_params_to_update)
          render json: @non_specialized_publication
        else
          render json: @non_specialized_publication.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_non_specialized_publication
        @non_specialized_publication = NonSpecializedPublication.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def non_spc_pub_params_to_create
        params.require(:non_specialized_publication).permit(:name, :project_title,
                                                            :start_date, :final_date,
                                                            :funding_institution, :url,
                                                            :circulation_route, :target_audiences,
                                                            :geo_city_id, :geo_state_id, :geo_country_id,
                                                            :category_id, :research_group_id,
                                                            :colciencias_call_id, :observation,
                                                            :active, :created_by)
      end

      def non_spc_pub_params_to_update
        params.require(:non_specialized_publication).permit(:name, :project_title,
                                                            :start_date, :final_date,
                                                            :funding_institution, :url,
                                                            :circulation_route, :target_audiences,
                                                            :geo_city_id, :geo_state_id, :geo_country_id,
                                                            :category_id, :research_group_id,
                                                            :colciencias_call_id, :observation,
                                                            :active, :updated_by)
      end
    end
  end
end