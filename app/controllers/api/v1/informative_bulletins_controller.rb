module Api
  module V1
    class InformativeBulletinsController < AbstractProductResearchUnitController
      include Swagger::InformativeBulletinApi

      before_action :set_research_group, only: [:index, :create]
      before_action :set_informative_bulletin, only: [:show, :update, :destroy]

      # GET /research_units/:id/informative_bulletins
      def index
        @informative_bulletins = CompleteInformativeBulletin.where(
          research_group_id: params[:research_group_id])
        @informative_bulletins = DxService.load(@informative_bulletins, params)

        render json: @informative_bulletins
      end

      # GET /informative_bulletins/1
      def show
        render json: @informative_bulletin
      end

      # POST /research_units/:id/informative_bulletins
      def create
        @informative_bulletin = @research_group.informative_bulletins.new(
          informative_bulletin_params_to_create)

        if @informative_bulletin.save
          render json: @informative_bulletin, status: :created
        else
          render json: @informative_bulletin.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /informative_bulletins/1
      def update
        if @informative_bulletin.update(informative_bulletin_params_to_update)
          render json: @informative_bulletin
        else
          render json: @informative_bulletin.errors, status: :unprocessable_entity
        end
      end

      # DELETE /informative_bulletins/1
      def destroy
        @informative_bulletin.destroy
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_informative_bulletin
        @informative_bulletin = InformativeBulletin.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def informative_bulletin_params_to_create
        params.require(:informative_bulletin).permit(:title, :elaboration_date, :institution, :url,
                                                     :geo_city_id, :geo_state_id, :geo_country_id,
                                                     :category_id, :research_group_id,
                                                     :colciencias_call_id, :observation,
                                                     :active, :created_by)
      end

      # Only allow a trusted parameter "white list" through.
      def informative_bulletin_params_to_update
        params.require(:informative_bulletin).permit(:title, :elaboration_date, :institution, :url,
                                                     :geo_city_id, :geo_state_id, :geo_country_id,
                                                     :category_id, :research_group_id,
                                                     :colciencias_call_id, :observation,
                                                     :active, :updated_by)
      end
    end

  end
end