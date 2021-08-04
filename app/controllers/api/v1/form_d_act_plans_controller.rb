class FormDActPlansController < ApplicationController
  before_action :set_form_d_act_plan, only: [:show, :update, :destroy]

  # GET /form_d_act_plans
  def index
    @form_d_act_plans = FormDActPlan.all

    render json: @form_d_act_plans
  end

  # GET /form_d_act_plans/1
  def show
    render json: @form_d_act_plan
  end

  # POST /form_d_act_plans
  def create
    @form_d_act_plan = FormDActPlan.new(form_d_act_plan_params)

    if @form_d_act_plan.save
      render json: @form_d_act_plan, status: :created, location: @form_d_act_plan
    else
      render json: @form_d_act_plan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /form_d_act_plans/1
  def update
    if @form_d_act_plan.update(form_d_act_plan_params)
      render json: @form_d_act_plan
    else
      render json: @form_d_act_plan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /form_d_act_plans/1
  def destroy
    @form_d_act_plan.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_d_act_plan
      @form_d_act_plan = FormDActPlan.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def form_d_act_plan_params
      params.require(:form_d_act_plan).permit(:name, :description, :goal_state_id, :goal_achieved, :order, :action_plan_id, :plan_type_id, :active, :created_by, :updated_by)
    end
end