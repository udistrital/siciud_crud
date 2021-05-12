module Api
  module V1
    class NutraceuticalProductsController < AbstractProductResearchUnitController
      include Swagger::NutraceuticalProductApi

      before_action :set_research_group, only: [:index, :create]
      before_action :set_nutraceutical_product, only: [:show, :update]

      # GET /research_units/:id/nutraceutical_products
      def index
        @nutraceutical_products = CompleteNutraceuticalProduct.where(
          research_group_id: params[:research_group_id])
        @nutraceutical_products = DxService.load(@nutraceutical_products, params)

        render json: @nutraceutical_products
      end

      # GET /nutraceutical_products/1
      def show
        render json: @nutraceutical_product
      end

      # POST /nutraceutical_products
      def create
        @nutraceutical_product = @research_group.nutraceutical_products.new(nut_product_params_to_create)

        if @nutraceutical_product.save
          render json: @nutraceutical_product, status: :created
        else
          render json: @nutraceutical_product.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /nutraceutical_products/1
      def update
        if @nutraceutical_product.update(nut_product_params_to_update)
          render json: @nutraceutical_product
        else
          render json: @nutraceutical_product.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_nutraceutical_product
        @nutraceutical_product = NutraceuticalProduct.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def nut_product_params_to_create
        params.require(:nutraceutical_product).permit(:name, :date_of_obtaining,
                                                      :research_project_title, :consecutive_registration_invima,
                                                      :geo_city_id, :category_id, :research_group_id,
                                                      :colciencias_call_id, :observation,
                                                      :active, :created_by)
      end

      def nut_product_params_to_update
        params.require(:nutraceutical_product).permit(:name, :date_of_obtaining, :research_project_title,
                                                      :consecutive_registration_invima, :geo_city_id,
                                                      :category_id, :research_group_id,
                                                      :colciencias_call_id, :observation,
                                                      :active, :updated_by)
      end
    end
  end
end