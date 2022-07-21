module Api
  module V1
    class ObjectivesController < AbstractProposalController
      include Swagger::ObjectiveApi

      before_action :set_proposal, only: [:create]
      before_action :set_objective, only: [:show, :update]

      # GET /proposal/:proposal_id/objectives
      def index
        if params[:proposal_id]
          @objectives = Objective.where(
            "proposal_id = ?", params[:proposal_id]
          )
        else
          @objectives = Objective.all
        end
        @objectives = DxService.load(@objectives, params)

        render json: @objectives
      end

      # GET /objectives/1
      def show
        render json: @objective
      end

      # POST /proposal/:proposal_id/objectives
      def create
        @objective = @proposal.objectives.new(objective_params_to_create)

        if @objective.save
          render json: @objective, status: :created
        else
          render json: @objective.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /objectives/1
      def update
        if @objective.update(objective_params_to_update)
          render json: @objective
        else
          render json: @objective.errors, status: :unprocessable_entity
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_objective
        @objective = Objective.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def objective_params_to_create
        params.require(:objective).permit(:description, :parent_id,
                                          :proposal_id, :active, :created_by)
      end

      def objective_params_to_update
        params.require(:objective).permit(:description, :parent_id,
                                          :proposal_id, :active, :updated_by)
      end
    end
  end
end