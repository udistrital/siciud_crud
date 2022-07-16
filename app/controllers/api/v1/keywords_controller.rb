module Api
  module V1
    class KeywordsController < ApplicationController
      include Swagger::KeywordApi

      before_action :set_keyword, only: [:show, :update]

      # GET /keywords
      def index
        @keywords = Keyword.all

        @keywords = DxService.load(@keywords, params)

        render json: @keywords
      end

      # GET /keywords/1
      def show
        render json: @keyword
      end

      # POST /keywords
      def create
        @keyword = Keyword.new(keyword_params_to_create)

        if @keyword.save
          render json: @keyword, status: :created
        else
          render json: @keyword.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /keywords/1
      def update
        if @keyword.update(keyword_params_to_update)
          render json: @keyword
        else
          render json: @keyword.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_keyword
        @keyword = Keyword.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def keyword_params_to_create
        params.require(:keyword).permit(:name, :active, :created_by)
      end

      def keyword_params_to_update
        params.require(:keyword).permit(:name, :active, :updated_by)
      end
    end
  end
end