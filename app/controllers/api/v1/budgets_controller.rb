module Api
  module V1
    class BudgetsController < ApplicationController
      include Swagger::BudgetApi
      before_action :set_budget, only: [:show, :update, :change_active]
      before_action :set_task, only: [:index, :create]

      # GET /budgets
      def index
        @budgets = @task.budgets

        render json: @budgets
      end

      # GET /budgets/1
      def show
        render json: @budget
      end

      # POST /budgets
      def create
        @budget = @task.budgets.new(budget_params_new)

        if @budget.save
          render json: @budget, status: :created
        else
          render json: @budget.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /budgets/1
      def update
        if @budget.update(budget_params_update)
          render json: @budget
        else
          render json: @budget.errors, status: :unprocessable_entity
        end
      end

      # PUT /research_group/:id/book_chapters/1/active
      def change_active
        if @budget.update(budget_params_to_deactivate)
          render json: @budget
        else
          render json: @budget.errors, status: :unprocessable_entity
        end
      end
      
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_budget
          @budget = Budget.find(params[:id])
        end
        def set_task
          @task = Task.find(params[:task_id])
        end

        # Only allow a trusted parameter "white list" through.
        def budget_params_new
          params.require(:budget).permit(:description, :ally_name, :used_date, :budget_type_id, :amount, :created_by)
        end
        def budget_params_update
          params.require(:budget).permit(:description, :ally_name, :used_date, :budget_type_id, :amount,  :updated_by)
        end
        def budget_params_to_deactivate
          params.require(:budget).permit(:active, :updated_by)
        end 
    end
  end
end
