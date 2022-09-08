module Api
  module V1
    class AnonymousEvaluatorsController < ApplicationController
      before_action :set_anonymous_evaluator, only: [:show, :update]

      # GET /anonymous_evaluators
      def index
        @anonymous_evaluators = AnonymousEvaluator.all

        render json: @anonymous_evaluators
      end

      # GET /anonymous_evaluators/1
      def show
        render json: @anonymous_evaluator
      end

      # POST /anonymous_evaluators
      def create
        @anonymous_evaluator = AnonymousEvaluator.new(anon_eval_params_to_create)

        if @anonymous_evaluator.save
          render json: @anonymous_evaluator, status: :created
        else
          render json: @anonymous_evaluator.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /anonymous_evaluators/1
      def update
        if @anonymous_evaluator.update(anon_eval_params_to_update)
          render json: @anonymous_evaluator
        else
          render json: @anonymous_evaluator.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /anonymous_evaluators/:anonymous_evaluator_id/proposal_evaluations
      def update_criteria
        
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_anonymous_evaluator
        @anonymous_evaluator = AnonymousEvaluator.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def anon_eval_params_to_create
        params.require(:anonymous_evaluator).permit(:code, :total,
                                                    :active, :created_by, :updated_by)
      end

      def anon_eval_params_to_update
        params.require(:anonymous_evaluator).permit(:code, :total,
                                                    :active, :created_by, :updated_by)
      end

      def criteria_params_to_update
        params.require(:anonymous_evaluator).permit(:code, :total,
                                                    :active, :updated_by,
                                                    criteria: []
                                                    )
      end
    end
  end
end