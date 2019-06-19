class PlanPeriodsController < ApplicationController
  before_action :set_plan_period, only: [:show, :update, :destroy]

  # GET /plan_periods
  def index
    @plan_periods = PlanPeriod.all

    render json: @plan_periods
  end

  # GET /plan_periods/1
  def show
    render json: @plan_period
  end

  # POST /plan_periods
  def create
    @context = context
    @plan_period = @context.PlanPeriod.new(plan_period_params)

    if @plan_period.save
      render json: @plan_period, status: :created, location: @plan_period
    else
      render json: @plan_period.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /plan_periods/1
  def update
    if @plan_period.update(plan_period_params)
      render json: @plan_period
    else
      render json: @plan_period.errors, status: :unprocessable_entity
    end
  end

  # DELETE /plan_periods/1
  def destroy
    @plan_period.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plan_period
      @context = context
      @plan_period = @context.PlanPeriod.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def plan_period_params
      params.fetch(:plan_period, {})
    end

    #Function that implements the polymorphic association
    #for more info see https://richonrails.com/articles/polymorphic-associations-in-rails controllers section
    def context
      if params[:research_group_id]
        id = params[:research_group_id]
        ResearchGroup.find(params[:research_group_id])
      elsif params[:research_seed_bed_id]
        id = params[:research_seed_bed_id]
        ResearchSeedbed.find(params[:research_seed_bed_id])
      end
    end

    def context_url(context)
      if ResearchGroup === context
        research_group_path(context)
      elsif ResearchSeedbed === context
        research_seed_bed_path(context)
      end
    end
end
