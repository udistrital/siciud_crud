module Api
  module V1
    class EvaluatorsController < ApplicationController
      include Swagger::EvaluatorApi

      before_action :set_evaluator, only: [:show, :update]

      # GET /evaluators
      def index
        @evaluators = Evaluator.all

        @evaluators = DxService.load(@evaluators, params)

        render json: @evaluators
      end

      # GET /evaluators/1
      def show
        render json: @evaluator
      end

      # POST /evaluators
      def create
        @evaluator = Evaluator.new(evaluator_params_to_create)

        if @evaluator.save
          render json: @evaluator, status: :created
        else
          render json: @evaluator.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /evaluators/1
      def update
        if @evaluator.update(evaluator_params_to_update)
          render json: @evaluator
        else
          render json: @evaluator.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_evaluator
        @evaluator = Evaluator.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def evaluator_params_to_create
        params.require(:evaluator).permit(:name, :cvlac_url, :email, :mobile,
                                          :academic_title, :active, :created_by)
      end

      def evaluator_params_to_update
        params.require(:evaluator).permit(:name, :cvlac_url, :email, :mobile,
                                          :academic_title, :active, :updated_by)
      end
    end
  end
end