module Api
  module V1
    class ProtocolActsController < AbstractProductResearchUnitController
      include Swagger::ProtocolActApi

      before_action :set_research_group, only: [:index, :create]
      before_action :set_protocol_act, only: [:show, :update]

      # GET /research_units/:id/protocol_acts
      def index
        @protocol_acts = CompleteProtocolAct.where(
          research_group_id: params[:research_group_id])
        @protocol_acts = DxService.load(@protocol_acts, params)

        render json: @protocol_acts
      end

      # GET /protocol_acts/1
      def show
        render json: @protocol_act
      end

      # POST /research_units/:id/protocol_acts
      def create
        @protocol_act = @research_group.protocol_acts.new(
          protocol_act_params_to_create)

        if @protocol_act.save
          render json: @protocol_act, status: :created
        else
          render json: @protocol_act.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /protocol_acts/1
      def update
        if @protocol_act.update(protocol_act_params_to_update)
          render json: @protocol_act
        else
          render json: @protocol_act.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_protocol_act
        @protocol_act = ProtocolAct.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def protocol_act_params_to_create
        params.require(:protocol_act).permit(:title, :date_of_publication, :geo_city_id,
                                             :category_id, :product_type_id, :research_group_id,
                                             :colciencias_call_id, :observation,
                                             :active, :created_by)
      end

      def protocol_act_params_to_update
        params.require(:protocol_act).permit(:title, :date_of_publication, :geo_city_id,
                                             :category_id, :product_type_id, :research_group_id,
                                             :colciencias_call_id, :observation,
                                             :active, :updated_by)
      end
    end
  end
end