module Api
  module V1
    class PotentialMarketsController < ApplicationController
      include Swagger::PotentialMarketApi
      before_action :set_potential_market, only: [:show, :update, :change_active]
      before_action :set_procedure_request, only: [:index, :create]

      # GET /potential_markets
      def index
        @potential_markets = @procedure_request.potential_market
        render json: @potential_markets
      end

      # GET /potential_markets/1
      def show
        render json: @potential_market
      end

      # POST /potential_markets
      def create
        @potential_market = @procedure_request.create_potential_market(potential_market_params_new.except(:segment_ids))
        segment_ids = potential_market_params_new[:segment_ids]
        if @potential_market.save
          save_segment(@potential_market,segment_ids)
          render json: @potential_market, status: :created
        else
          render json: @potential_market.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /potential_markets/1
      def update
        if @potential_market.update(potential_market_params_update)
          render json: @potential_market
        else
          render json: @potential_market.errors, status: :unprocessable_entity
        end
      end

      # PUT /potential_markets/:id/active
      def change_active
        if @potential_market.update(potential_market_params_to_deactivate)
          render json: @potential_market
        else
          render json: @potential_market.errors, status: :unprocessable_entity
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_potential_market
          @potential_market = PotentialMarket.find(params[:id])
        end

        def save_segment(potential_market,segment_ids)
          potential_market.segment_ids = (segment_ids).map(&:to_i).uniq
        end

        def set_procedure_request
          @procedure_request = ProcedureRequest.find(params[:procedure_request_id])
        end

        # Only allow a trusted parameter "white list" through.
        def potential_market_params_new
          params.require(:potential_market).permit( :market_participation_id, :necesary_time, :product_dependency, :product_dependency_name, 
                                                    :institution_participation, :institution_participation_name, :stakeholder, :success_rank_id, 
                                                    :market_place,:created_by, geo_country_ids:[],segment_ids:[])
        end
        def potential_market_params_update
          params.require(:potential_market).permit( :market_participation_id, :necesary_time, :product_dependency, :product_dependency_name, 
                                                    :institution_participation, :institution_participation_name, :stakeholder, :success_rank_id, 
                                                    :market_place,:updated_by, geo_country_ids:[], segment_ids:[])
        end
        def potential_market_params_to_deactivate
          params.require(:potential_market).permit(:active, :updated_by)
        end
    end
  end
end
