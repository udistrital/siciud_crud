class AgreementController < ApplicationController
  before_action :set_agreement, only: [:show, :update]
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { error: e.message }, status: :not_found
  end
  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: { error: e.message }, status: :unprocessable_entity
  end

  def index
    #Listar todos los convenios
    @agreements = Agreement.all
    paginate json: @agreements
  end

  def show
    render json: @agreement
  end

  def create
    @agreement = Agreement.new(agreement_params)
    @agreement.registerDate = DateTime.now.in_time_zone(-5).to_date
    if @agreement.save
      render json: @agreement, status: :created
    else
      render json: @agreement.errors, status: :unprocessable_entity
    end
  end

  def update
    if @agreement.update(agreement_params)
      render json: @agreement
    else
      render json: @agreement.errors, status: :unprocessable_entity
    end
  end

  private

  def set_agreement
    @agreement = Agreement.find(params[:id])
  end

  def agreement_params
    params.require(:agreement).permit(:name, :registerDate, :startDate, :finalDate, :duration, :availability, :bizagiNumber, :description,
                                      :agreementNumber, :agreement_status_id, :agreement_type_id, research_group_ids: [])
  end
end
