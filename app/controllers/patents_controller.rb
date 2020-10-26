class PatentsController < ApplicationController
  before_action :set_patent, only: [:show, :update, :destroy]

  # GET /patents
  def index
    @patents = Patent.all

    render json: @patents
  end

  # GET /patents/1
  def show
    render json: @patent
  end

  # POST /patents
  def create
    @patent = Patent.new(patent_params)

    if @patent.save
      render json: @patent, status: :created, location: @patent
    else
      render json: @patent.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /patents/1
  def update
    if @patent.update(patent_params)
      render json: @patent
    else
      render json: @patent.errors, status: :unprocessable_entity
    end
  end

  # DELETE /patents/1
  def destroy
    @patent.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patent
      @patent = Patent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def patent_params
      params.require(:patent).permit(:patent_number, :title, :date_of_obtaining, :industrial_publication_gazette, :observation, :category_id, :patent_state_id, :research_group_id)
    end
end
