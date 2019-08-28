module Api
  module V1
    class ArpExpenseController < ApplicationController
      #before_action :set_agreement_research_project
      before_action :set_contribution_rp_item
      before_action :set_arp_expense, only: [:show, :update]

      def index
        @arp_expenses = @contribution_rp_item.arp_expenses
        render json: @arp_expenses
      end

      def show
        render json: @arp_expense
      end

      def create
        #byebug
        if ((params[:arp_expense][:inCashValue] <= @contribution_rp_item.remainingCash) &&
            (params[:arp_expense][:inKindValue] <= @contribution_rp_item.remainingInKind))
          @arp_expense = @contribution_rp_item.arp_expenses.new(arp_expense_params)
          #@arp_expense = ArpExpense.new(arp_expense_params)
          @arp_expense.totalPayedInCash = 0
          @arp_expense.totalPayedInKind = 0
          @arp_expense.remainingInCash = @arp_expense.inCashValue
          @arp_expense.remainingInKind = @arp_expense.inKindValue
          @arp_expense.remaining = @arp_expense.remainingInCash + @arp_expense.remainingInKind
          @arp_expense.totalPayed = 0

          #@contribution_rp_item.executedCash =
          #@contribution_rp_item.executedInKind =
          @contribution_rp_item.compromisedCash += @arp_expense.inCashValue
          @contribution_rp_item.compromisedInKind += @arp_expense.inKindValue
          @contribution_rp_item.remainingCash -= @arp_expense.inCashValue
          @contribution_rp_item.remainingInKind -= @arp_expense.inKindValue
        else
          return render json: { "error": "No se puede gastar mas del presupuesto asignado" }, status: :not_acceptable
        end
        if @arp_expense.save
          @contribution_rp_item.save
          render json: @arp_expense, status: :created
        else
          render json: @arp_expense.errors, status: :unprocessable_entity
        end
      end

      def update
        diferenceCashValue = params[:arp_expense][:inCashValue] - @arp_expense.inCashValue
        diferenceInKindValue = params[:arp_expense][:inKindValue] - @arp_expense.inKindValue
        if (((params[:arp_expense][:inCashValue] + diferenceCashValue) <= @contribution_rp_item.remainingCash) &&
            ((params[:arp_expense][:inKindValue] + diferenceInKindValue) <= @contribution_rp_item.remainingInKind))
          if @arp_expense.update(arp_expense_params)
            @contribution_rp_item.compromisedCash += @arp_expense.inCashValue
            @contribution_rp_item.compromisedInKind += @arp_expense.inKindValue
            @contribution_rp_item.remainingCash -= @arp_expense.inCashValue
            @contribution_rp_item.remainingInKind -= @arp_expense.inKindValue
            render json: @arp_expense
          else
            render json: @arp_expense.errors, status: :unprocessable_entity
          end
        else
          return render json: { "error": "No se puede gastar mas del presupuesto asignado" }, status: :not_acceptable
        end
      end

      private

      def set_arp_expense
        @arp_expense = @contribution_rp_item.arp_expenses.find_by(id: params[:id])
      end

      def arp_expense_params
        params.require(:arp_expense).permit(:name, :inKindValue, :inCashValue,
                                            :description, :date, :code, :bizagiCode)
      end

      def set_contribution_rp_item
        @contribution_rp_item = ContributionRpItem.find(params[:contribution_rp_item_id])
      end
    end
  end
end
