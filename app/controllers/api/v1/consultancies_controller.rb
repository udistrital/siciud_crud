class ConsultanciesController < AbstractProductResearchUnitController
  include Swagger::ConsultancyApi

  before_action :set_research_group, only: [:index, :create]
  before_action :set_consultancy, only: [:show, :update]

  # GET /research_units/:id/consultancies
  def index
    if params[:product_type_id]
      @consultancies = CompleteConsultancy.where(
        "research_group_id = ? AND product_type_id = ?",
        params[:research_group_id], params[:product_type_id]
      )
    else
      @consultancies = CompleteConsultancy.where(
        research_group_id: params[:research_group_id])
    end
    @consultancies = DxService.load(@consultancies, params)

    render json: @consultancies
  end

  # GET /consultancies/1
  def show
    render json: @consultancy
  end

  # POST /research_units/:id/consultancies
  def create
    @consultancy = @research_group.consultancies.new(consultancy_params_to_create)

    if @consultancy.save
      render json: @consultancy, status: :created
    else
      render json: @consultancy.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /consultancies/1
  def update
    if @consultancy.update(consultancy_params_to_update)
      render json: @consultancy
    else
      render json: @consultancy.errors, status: :unprocessable_entity
    end
  end

  # DELETE /consultancies/1
  def destroy
    @consultancy.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_consultancy
    @consultancy = Consultancy.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def consultancy_params_to_create
    params.require(:consultancy).permit(:title, :contract_number, :consulting_objective,
                                        :consultation_date, :geo_city_id, :geo_state_id,
                                        :geo_country_id, :category_id, :product_type_id,
                                        :research_group_id, :colciencias_call_id,
                                        :observation, :active, :created_by)
  end

  def consultancy_params_to_update
    params.require(:consultancy).permit(:title, :contract_number, :consulting_objective,
                                        :consultation_date, :geo_city_id, :geo_state_id,
                                        :geo_country_id, :category_id, :product_type_id,
                                        :research_group_id, :colciencias_call_id,
                                        :observation, :active, :updated_by)
  end
end
