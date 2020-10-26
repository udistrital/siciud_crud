class AwardsController < ApplicationController
  before_action :set_award, only: [:show, :update]

  # Handling of database exceptions
  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: {error: e.message}, status: :not_found
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    render json: {error: e.message}, status: :unprocessable_entity
  end

  # GET /awards
  def index
    @awards = Award.all

    render json: @awards
  end

  # GET /awards/1
  def show
    render json: @award
  end

  # POST /awards
  def create
    @award = Award.new(award_params)

    if @award.save
      render json: @award, status: :created, location: @award
    else
      render json: @award.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /awards/1
  def update
    if @award.update(award_params)
      render json: @award
    else
      render json: @award.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_award
    @award = Award.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def award_params
    params.require(:award).permit(:name, :is_national,
                                  :research_creation_work_id)
  end
end
