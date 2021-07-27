module Api
  module V1
    class IndicatorsController < ApplicationController
      include Swagger::IndicatorApi

      before_action :set_indicator, only: [:show, :update]

      # GET /indicators
      def index
        @indicators = Indicator.all

        render json: @indicators
      end

      # GET /indicators/1
      def show
        render json: @indicator
      end

      # POST /indicators
      def create
        @indicator = Indicator.new(indicator_params_to_create)

        if @indicator.save
          render json: @indicator, status: :created
        else
          render json: @indicator.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /indicators/1
      def update
        if @indicator.update(indicator_params_to_update)
          render json: @indicator
        else
          render json: @indicator.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_indicator
        @indicator = Indicator.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def indicator_params_to_create
        params.require(:indicator).permit(:product_type_id, :ind_description,
                                          :active, :created_by)
      end

      def indicator_params_to_update
        params.require(:indicator).permit(:product_type_id, :ind_description,
                                          :active, :updated_by)
      end
    end
  end
end