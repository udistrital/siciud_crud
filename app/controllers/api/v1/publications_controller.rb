module Api
  module V1
    class PublicationsController < AbstractProductResearchUnitController
      include Swagger::PublicationApi

      before_action :set_research_group, only: [:index, :create]
      before_action :set_publication, only: [:show, :update]

      # GET research_units/:id/publications
      def index
        if params[:product_type_id]
          @publications = CompletePublication.where(
            "research_group_id = ? AND product_type_id = ?",
            params[:research_group_id], params[:product_type_id]
          )
        else
          @publications = CompletePublication.where(
            research_group_id: params[:research_group_id])
        end
        @publications = DxService.load(@publications, params)

        render json: @publications
      end

      # GET /publications/1
      def show
        render json: @publication
      end

      # POST /research_units/:id/publications
      def create
        @publication = @research_group.publications.new(publication_params_to_create)

        if @publication.save
          render json: @publication, status: :created
        else
          render json: @publication.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /publications/1
      def update
        if @publication.update(publication_params_to_update)
          render json: @publication
        else
          render json: @publication.errors, status: :unprocessable_entity
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_publication
        @publication = Publication.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def publication_params_to_create
        params.require(:publication).permit(:name, :project_title,
                                            :start_date, :final_date,
                                            :funding_institution, :url,
                                            :circulation_route, :target_audiences,
                                            :duration, :duration_type_id,
                                            :geo_city_id, :geo_state_id,
                                            :geo_country_id, :category_id,
                                            :product_type_id, :research_group_id,
                                            :colciencias_call_id, :observation,
                                            :active, :created_by)
      end

      # Only allow a trusted parameter "white list" through.
      def publication_params_to_update
        params.require(:publication).permit(:name, :project_title,
                                            :start_date, :final_date,
                                            :funding_institution, :url,
                                            :circulation_route, :target_audiences,
                                            :duration, :duration_type_id,
                                            :geo_city_id, :geo_state_id,
                                            :geo_country_id, :category_id,
                                            :product_type_id, :research_group_id,
                                            :colciencias_call_id, :observation,
                                            :active, :updated_by)
      end
    end
  end
end