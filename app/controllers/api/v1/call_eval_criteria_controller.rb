module Api
  module V1
    class CallEvalCriteriaController < AbstractCallController
      include Swagger::CallEvalCriterionApi
      
      before_action :set_call, only: [:create]
      before_action :set_call_eval_criterion, only: [:show, :update]

      # GET calls/:call_id/call_eval_criteria
      def index
        @call_eval_criteria = CompleteCallEvalCriterion.where(
          "call_id = ?", params[:call_id]
        )
        @call_eval_criteria = DxService.load(@call_eval_criteria, params)

        render json: @call_eval_criteria
      end

      # GET /call_eval_criteria/1
      def show
        render json: @call_eval_criterion
      end

      # POST calls/:call_id/call_eval_criteria
      def create
        @call_eval_criterion = @call.call_eval_criteria.new(c_eval_c_params_to_create)

        if @call_eval_criterion.save
          render json: @call_eval_criterion, status: :created
        else
          render json: @call_eval_criterion.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /call_eval_criteria/1
      def update
        if @call_eval_criterion.update(c_eval_c_params_to_update)
          render json: @call_eval_criterion
        else
          render json: @call_eval_criterion.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_call_eval_criterion
        @call_eval_criterion = CallEvalCriterion.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def c_eval_c_params_to_create
        params.require(:call_eval_criterion).permit(:eval_criterion_id, :cec_percentage,
                                                    :active, :created_by)
      end

      def c_eval_c_params_to_update
        params.require(:call_eval_criterion).permit(:call_id, :eval_criterion_id,
                                                    :cec_percentage, :active, :updated_by)
      end
    end
  end
end