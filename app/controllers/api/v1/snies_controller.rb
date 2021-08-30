module Api
  module V1
    class SniesController < ApplicationController
      include Swagger::SniesApi

      before_action :set_snies, only: [:show, :update]

      # GET /snies
      def index
        @snies = Snies.all
        @snies = DxService.load(@snies, params)
        render json: @snies
      end

      # GET /snies/1
      def show
        render json: @snies
      end

      # POST /snies
      def create
        @snies = Snies.new(snies_params)

        if @snies.save
          render json: @snies, status: :created
        else
          render json: @snies.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /snies/1
      def update
        if @snies.update(snies_params)
          render json: @snies
        else
          render json: @snies.errors, status: :unprocessable_entity
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_snies
        @snies = Snies.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def snies_params
        params.require(:snies).permit(:code, :name,
                                      :active, :created_by, :updated_by)
      end
    end
  end
end