class FormAActPlansController < ApplicationController
  before_action :set_form_a_act_plan, only: [:show, :update, :destroy]

  # GET /form_a_act_plans
  def index
    @form_a_act_plans = FormAActPlan.all

    render json: @form_a_act_plans
  end

  # GET /form_a_act_plans/1
  def show
    render json: @form_a_act_plan
  end

  # POST /form_a_act_plans
  def create
    @form_a_act_plan = FormAActPlan.new(form_a_act_plan_params)

    if @form_a_act_plan.save
      render json: @form_a_act_plan, status: :created, location: @form_a_act_plan
    else
      render json: @form_a_act_plan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /form_a_act_plans/1
  def update
    if @form_a_act_plan.update(form_a_act_plan_params)
      render json: @form_a_act_plan
    else
      render json: @form_a_act_plan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /form_a_act_plans/1
  def destroy
    @form_a_act_plan.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_a_act_plan
      @form_a_act_plan = FormAActPlan.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def form_a_act_plan_params
      params.require(:form_a_act_plan).permit(:product_type_id, :indicator_id, :goal, :advanced_total, :order, :action_plan_id, :plan_type_id, :active, :created_by, :updated_by)
    end
end
