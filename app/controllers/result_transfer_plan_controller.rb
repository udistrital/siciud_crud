class ResultTransferPlanController < ApplicationController
  before_action :set_result_transfer_plan, only: [:show, :update, :destroy]

  # GET /result_transfer_plans
  def index
    @result_transfer_plans = ResultTransferPlan.all

    render json: @result_transfer_plans
  end

  # GET /result_transfer_plans/1
  def show
    render json: @result_transfer_plan
  end

  # POST /result_transfer_plans
  def create
    @result_transfer_plan = ResultTransferPlan.new(result_transfer_plan_params)
    @result_transfer_plan.plan_period_id = params[:plan_period_id]
    #byebug
    if @result_transfer_plan.save
      render json: @result_transfer_plan, status: :created
      #, location: @result_transfer_plan
    else
      render json: @result_transfer_plan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /result_transfer_plans/1
  def update
    if @result_transfer_plan.update(result_transfer_plan_params)
      render json: @result_transfer_plan
    else
      render json: @result_transfer_plan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /result_transfer_plans/1
  def destroy
    @result_transfer_plan.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_result_transfer_plan
    @result_transfer_plan = ResultTransferPlan.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def result_transfer_plan_params
    params.require(:result_transfer_plan).permit(:activity, :description, :goal)
  end
end
