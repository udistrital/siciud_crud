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
        @arp_expense = ArpExpense.new(arp_expense_params)
        @arp_expense.totalPayedInCash = 0
        @arp_expense.totalPayedInKind = 0
        @arp_expense.remainingInCash = @arp_expense.inKindValue
        @arp_expense.remainingInKind = @arp_expense.inCashValue
        @arp_expense.remaining = @arp_expense.remainingInCash + arp_expense.remainingInKind
        @arp_expense.totalPayed = 0

        if @arp_expense.save
          render json: @arp_expense, status: :created
        else
          render json: @arp_expense.errors, status: :unprocessable_entity
        end
      end

      def update
        if @arp_expense.update(arp_expense_params)
          render json: @arp_expense
        else
          render json: @arp_expense.errors, status: :unprocessable_entity
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
