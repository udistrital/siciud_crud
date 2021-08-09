class KnwlPlansController < ApplicationController
  before_action :set_knwl_plan, only: [:show, :update, :destroy]

  # GET /knwl_plans
  def index
    @knwl_plans = KnwlPlan.all

    render json: @knwl_plans
  end

  # GET /knwl_plans/1
  def show
    render json: @knwl_plan
  end

  # POST /knwl_plans
  def create
    @knwl_plan = KnwlPlan.new(knwl_plan_params)

    if @knwl_plan.save
      render json: @knwl_plan, status: :created, location: @knwl_plan
    else
      render json: @knwl_plan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /knwl_plans/1
  def update
    if @knwl_plan.update(knwl_plan_params)
      render json: @knwl_plan
    else
      render json: @knwl_plan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /knwl_plans/1
  def destroy
    @knwl_plan.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_knwl_plan
      @knwl_plan = KnwlPlan.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def knwl_plan_params
      params.require(:knwl_plan).permit(:knwl_area_id, :knwl_area_type, :form_d_act_plan_id, :active, :created_by, :updated_by)
    end
end
