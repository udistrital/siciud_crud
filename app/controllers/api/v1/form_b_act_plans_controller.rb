class FormBActPlansController < ApplicationController
  before_action :set_form_b_act_plan, only: [:show, :update, :destroy]

  # GET /form_b_act_plans
  def index
    @form_b_act_plans = FormBActPlan.all

    render json: @form_b_act_plans
  end

  # GET /form_b_act_plans/1
  def show
    render json: @form_b_act_plan
  end

  # POST /form_b_act_plans
  def create
    @form_b_act_plan = FormBActPlan.new(form_b_act_plan_params)

    if @form_b_act_plan.save
      render json: @form_b_act_plan, status: :created, location: @form_b_act_plan
    else
      render json: @form_b_act_plan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /form_b_act_plans/1
  def update
    if @form_b_act_plan.update(form_b_act_plan_params)
      render json: @form_b_act_plan
    else
      render json: @form_b_act_plan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /form_b_act_plans/1
  def destroy
    @form_b_act_plan.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_b_act_plan
      @form_b_act_plan = FormBActPlan.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def form_b_act_plan_params
      params.require(:form_b_act_plan).permit(:financing_type_id, :description, :goal_state_id, :goal_achieved, :order, :action_plan_id, :plan_type_id, :active, :created_by, :updated_by)
    end
end
