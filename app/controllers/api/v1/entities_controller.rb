module Api
  module V1
    class EntitiesController < ApplicationController
      include Swagger::EntityApi
      before_action :set_entity, only: [:show, :update]

      # GET /entities
      def index
        @entities = CompleteEntity.all
        @entities = DxService.load(@entities, params)
        render json: @entities
      end

      # GET /entities/1
      def show
        render json: @entity
      end

      # POST /entities
      def create
        @entity = Entity.new(entity_params_to_create)

        if @entity.save
          render json: @entity, status: :created
        else
          render json: @entity.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /entities/1
      def update
        if @entity.update(entity_params_to_update)
          render json: @entity
        else
          render json: @entity.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_entity
        @entity = Entity.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def entity_params_to_create
        params.require(:entity).permit(:name, :nit, :check_digit,
                                       :constitution_date, :legal_nature_id,
                                       :institution_type_id,
                                       :geo_city_id, :geo_country_id, :geo_state_id,
                                       :headquarters_address, :email, :phone,
                                       :registration, :web_page, :active,
                                       :created_by)
      end

      def entity_params_to_update
        params.require(:entity).permit(:name, :nit, :check_digit,
                                       :constitution_date, :legal_nature_id,
                                       :institution_type_id,
                                       :geo_city_id, :geo_country_id, :geo_state_id,
                                       :headquarters_address, :email, :phone,
                                       :registration, :web_page, :active,
                                       :updated_by)
      end
    end
  end
end