module Api
  module V1
    class ContentGenerationsController < AbstractProductResearchUnitController
      include Swagger::ContentGenerationApi

      before_action :set_research_group, only: [:index, :create]
      before_action :set_content_generation, only: [:show, :update, :destroy]

      # GET /research_units/:id/content_generations
      def index
        if params[:product_type_id]
        @content_generations = CompleteContentGeneration.where(
          "research_group_id = ? AND product_type_id = ?",
          research_group_id: params[:research_group_id])
        else
          @content_generations = CompleteContentGeneration.where(
            research_group_id: params[:research_group_id])
        end
        @content_generations = DxService.load(@content_generations, params)
        render json: @content_generations
      end

      # GET /content_generations/1
      def show
        render json: @content_generation
      end

      # POST /research_units/:id/content_generations
      def create
        @content_generation = @research_group.content_generations.new(
          content_generation_params_to_create)

        if @content_generation.save
          render json: @content_generation, status: :created
        else
          render json: @content_generation.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /content_generations/1
      def update
        if @content_generation.update(content_generation_params_to_update)
          render json: @content_generation
        else
          render json: @content_generation.errors, status: :unprocessable_entity
        end
      end

      # DELETE /content_generations/1
      def destroy
        @content_generation.destroy
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_content_generation
        @content_generation = ContentGeneration.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def content_generation_params_to_create
        params.require(:content_generation).permit(:magazine_name, :isbn, :title,
                                                   :generation_date, :doi,
                                                   :bibliographic_reference, :web_page,
                                                   :volume, :pages_number, :start_page,
                                                   :final_page, :geo_city_id, :geo_state_id,
                                                   :geo_country_id, :category_id,
                                                   :product_type_id, :research_group_id,
                                                   :colciencias_call_id, :observation, :active,
                                                   :created_by)
      end

      def content_generation_params_to_update
        params.require(:content_generation).permit(:magazine_name, :isbn, :title,
                                                   :generation_date, :doi,
                                                   :bibliographic_reference, :web_page,
                                                   :volume, :pages_number, :start_page,
                                                   :final_page, :geo_city_id, :geo_state_id,
                                                   :geo_country_id, :category_id,
                                                   :product_type_id, :research_group_id,
                                                   :colciencias_call_id, :observation, :active,
                                                   :updated_by)
      end
    end
  end
end