module Api
  module V1
    class PlantIndPrototypesController < AbstractProductResearchUnitController
      include Swagger::PlantIndPrototypeApi

      before_action :set_research_group
      before_action :set_plant_ind_prototype, only: [:show, :update, :change_active]
      before_action only: [:change_active] do
        active_in_body_params? pip_params_to_deactivate
      end

      # GET /research_units/:id/plant_ind_prototypes
      def index
        @plant_ind_prototypes = CompletePltIndProt.where(
          research_group_id: params[:research_group_id]
        )
        @plant_ind_prototypes = DxService.load(@plant_ind_prototypes, params)

        render json: @plant_ind_prototypes
      end

      # GET /research_units/:id/plant_ind_prototypes/1
      def show
        render json: @plant_ind_prototype
      end

      # POST /research_units/:id/plant_ind_prototypes
      def create
        @plant_ind_prototype = @research_group.plant_ind_prototypes.new(
          pip_params_to_create)

        if @plant_ind_prototype.save
          render json: @plant_ind_prototype, status: :created
        else
          render json: @plant_ind_prototype.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_units/:id/plant_ind_prototypes/1
      def update
        if @plant_ind_prototype.update(pip_params_to_update)
          render json: @plant_ind_prototype
        else
          render json: @plant_ind_prototype.errors, status: :unprocessable_entity
        end
      end

      # PUT /research_units/:id/plant_ind_prototypes/1/active
      def change_active
        if @plant_ind_prototype.update(pip_params_to_update)
          render json: @plant_ind_prototype
        else
          render json: @plant_ind_prototype.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_plant_ind_prototype
        @plant_ind_prototype = PlantIndPrototype.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def pip_params_to_create
        params.require(:plant_ind_prototype).permit(
          :plt_name, :plt_registration_number, :plt_date_of_elaboration,
          :geo_city_id, :category_id, :colciencias_call_id, :institution_name,
          :observation, :plt_type_id, :created_by)
      end

      def pip_params_to_update
        params.require(:plant_ind_prototype).permit(
          :plt_name, :plt_registration_number, :plt_date_of_elaboration,
          :geo_city_id, :category_id, :colciencias_call_id, :institution_name,
          :observation, :plt_type_id, :updated_by)
      end

      def pip_params_to_deactivate
        params.require(:plant_ind_prototype).permit(
          :active, :updated_by)
      end
    end
  end
end