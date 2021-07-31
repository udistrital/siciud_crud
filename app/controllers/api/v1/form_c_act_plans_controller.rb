class FormCActPlansController < ApplicationController
  before_action :set_form_c_act_plan, only: [:show, :update, :destroy]

  # GET /form_c_act_plans
  def index
    @form_c_act_plans = FormCActPlan.all

    render json: @form_c_act_plans
  end

  # GET /form_c_act_plans/1
  def show
    render json: @form_c_act_plan
  end

  # POST /form_c_act_plans
  def create
    @form_c_act_plan = FormCActPlan.new(form_c_act_plan_params)

    if @form_c_act_plan.save
      render json: @form_c_act_plan, status: :created, location: @form_c_act_plan
    else
      render json: @form_c_act_plan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /form_c_act_plans/1
  def update
    if @form_c_act_plan.update(form_c_act_plan_params)
      render json: @form_c_act_plan
    else
      render json: @form_c_act_plan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /form_c_act_plans/1
  def destroy
    @form_c_act_plan.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_c_act_plan
      @form_c_act_plan = FormCActPlan.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def form_c_act_plan_params
      params.require(:form_c_act_plan).permit(:product_type_id, :description, :goal, :advanced_total, :order, :action_plan_id, :plan_type_id, :active, :created_by, :updated_by)
    end
end
