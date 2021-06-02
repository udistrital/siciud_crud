module Api
  module V1
    class MagazineEditionsController < AbstractProductResearchUnitController
      include Swagger::MagazineEditionApi

      before_action :set_research_group, only: [:index, :create]
      before_action :set_magazine_edition, only: [:show, :update, :destroy]

      # GET /research_units/:id/magazine_editions
      def index
        @magazine_editions = CompleteMagazineEdition.where(
          research_group_id: params[:research_group_id])
        @magazine_editions = DxService.load(@magazine_editions, params)

        render json: @magazine_editions
      end

      # GET /magazine_editions/1
      def show
        render json: @magazine_edition
      end

      # POST /research_units/:id/magazine_editions
      def create
        @magazine_edition = @research_group.magazine_editions.new(
          magazine_edition_params_to_create)

        if @magazine_edition.save
          render json: @magazine_edition, status: :created
        else
          render json: @magazine_edition.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /magazine_editions/1
      def update
        if @magazine_edition.update(magazine_edition_params_to_update)
          render json: @magazine_edition
        else
          render json: @magazine_edition.errors, status: :unprocessable_entity
        end
      end


      private
      # Use callbacks to share common setup or constraints between actions.
      def set_magazine_edition
        @magazine_edition = MagazineEdition.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def magazine_edition_params_to_create
        params.require(:magazine_edition).permit(:title,
                                                 :editorial_name,
                                                 :issn,
                                                 :publication_year,
                                                 :geo_city_id,
                                                 :geo_state_id,
                                                 :geo_country_id,
                                                 :editorial_date,
                                                 :category_id,
                                                 :research_group_id,
                                                 :colciencias_call_id,
                                                 :observation,
                                                 :active,
                                                 :created_by)
      end

      # Only allow a trusted parameter "white list" through.
      def magazine_edition_params_to_update
        params.require(:magazine_edition).permit(:title,
                                                 :editorial_name,
                                                 :issn,
                                                 :publication_year,
                                                 :geo_city_id,
                                                 :geo_state_id,
                                                 :geo_country_id,
                                                 :editorial_date,
                                                 :category_id,
                                                 :research_group_id,
                                                 :colciencias_call_id,
                                                 :observation,
                                                 :active,
                                                 :updated_by)
      end
    end
  end
end