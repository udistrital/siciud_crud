class Api::V1::ArpPaymentController < ApplicationController
  before_action :set_arp_expense
  before_action :set_contribution_rp_item
  before_action :set_arp_payment, only: [:show, :update, :attach]

  def index
    @arp_payments = @arp_expense.arp_payments
    render json: @arp_payments
  end

  def show
    render json: @arp_payment
  end

  def create
    if ((params[:arp_payment][:inCashValue] <= @arp_expense.remainingInCash) &&
        (params[:arp_payment][:inKindValue] <= @arp_expense.remainingInKind))
      @arp_payment = @arp_expense.arp_payments.new(arp_payment_params)
      @arp_expense.totalPayedInCash += @arp_payment.inCashValue
      @arp_expense.totalPayedInKind += @arp_payment.inKindValue
      @arp_expense.remainingInCash -= @arp_payment.inCashValue
      @arp_expense.remainingInKind -= @arp_payment.inKindValue
      @arp_expense.remaining = @arp_expense.remainingInCash + @arp_expense.remainingInKind
      @arp_expense.totalPayed += @arp_expense.totalPayedInCash + @arp_expense.totalPayedInKind
      @contribution_rp_item.compromisedCash -= @arp_payment.inCashValue
      @contribution_rp_item.compromisedInKind -= @arp_payment.inKindValue
      #@contribution_rp_item.remainingCash -= @arp_expense.inCashValue
      #@contribution_rp_item.remainingInKind -= @arp_expense.inKindValue
      @contribution_rp_item.executedCash += @arp_payment.inCashValue
      @contribution_rp_item.executedInKind += @arp_payment.inKindValue
      if(@arp_expense.remaining == 0)
        @arp_expense.is_payed = true
      end
    else
      return render json: { "error": "No se puede pagar mas del valor asignado" }, status: :not_acceptable
    end
    if @arp_payment.save && @arp_expense.save
      @contribution_rp_item.save
      render json: @arp_payment, status: :created
    else
      render json: @arp_payment.errors, status: :unprocessable_entity
    end
  end

  def attach
    #byebug
    params.permit(:paymentDocument)
    if (params[:paymentDocument])
      @arp_payment.paymentDocument.attach(params[:paymentDocument])
    end
    if (params[:rpDocument])
      @arp_payment.rpDocument.attach(params[:rpDocument])
    end
    if (params[:cdpDocument])
      @arp_payment.cdpDocument.attach(params[:cdpDocument])
    end
    render json: @arp_payment
  end

  private

  #/api/v1/arp_expense/:arp_expense_id/arp_payment
  def set_arp_expense
    #@agreement_research_project = @agreement.agreement_research_projects.find_by(id: params[:id])
    @arp_expense = ArpExpense.find(params[:arp_expense_id])
  end

  def arp_payment_params
    params.require(:arp_payment).permit(:inCashValue, :inKindValue, :date, :rpCode, :bizagiCode,:cdpCode)
  end

  def set_arp_payment
    @arp_payment = @arp_expense.arp_payments.find_by(id: params[:id])
  end

  def set_contribution_rp_item
    @contribution_rp_item = @arp_expense.contribution_rp_item
  end
end
