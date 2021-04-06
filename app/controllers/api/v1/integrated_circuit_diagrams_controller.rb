module Api
  module V1
    class IntegratedCircuitDiagramsController < AbstractProductResearchUnitController
      before_action :set_research_group
      before_action :set_integrated_circuit_diagram, only: [:show, :update, :change_active]
      before_action only: [:change_active] do
        active_in_body_params? icd_params_to_deactivate
      end

      # GET /research_units/:id/integrated_circuit_diagrams
      def index
        @integrated_circuit_diagrams = CompleteIcd.where(
          research_group_id: params[:research_group_id]
        )
        @integrated_circuit_diagrams = DxService.load(@integrated_circuit_diagrams, params)

        render json: @integrated_circuit_diagrams
      end

      # GET /research_units/:id/integrated_circuit_diagrams/1
      def show
        render json: @integrated_circuit_diagram
      end

      # POST /research_units/:id/integrated_circuit_diagrams
      def create
        @integrated_circuit_diagram = @research_group.integrated_circuit_diagrams.new(
          icd_params_to_create)

        if @integrated_circuit_diagram.save
          render json: @integrated_circuit_diagram, status: :created
        else
          render json: @integrated_circuit_diagram.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_units/:id/integrated_circuit_diagrams/1
      def update
        if @integrated_circuit_diagram.update(icd_params_to_updated)
          render json: @integrated_circuit_diagram
        else
          render json: @integrated_circuit_diagram.errors, status: :unprocessable_entity
        end
      end

      # PUT /research_units/:id/integrated_circuit_diagrams/1/active
      def change_active
        if @integrated_circuit_diagram.update(icd_params_to_deactivate)
          render json: @integrated_circuit_diagram
        else
          render json: @integrated_circuit_diagram.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_integrated_circuit_diagram
        @integrated_circuit_diagram = @research_group.integrated_circuit_diagrams.find(
          params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def icd_params_to_create
        params.require(:integrated_circuit_diagram).permit(
          :icd_registration_number, :icd_registration_title,
          :icd_date_of_obtaining, :geo_country_id, :category_id,
          :colciencias_call_id, :observation, :created_by)
      end

      def icd_params_to_updated
        params.require(:integrated_circuit_diagram).permit(
          :icd_registration_number, :icd_registration_title,
          :icd_date_of_obtaining, :geo_country_id, :category_id,
          :colciencias_call_id, :observation, :updated_by)
      end

      def icd_params_to_deactivate
        params.require(:integrated_circuit_diagram).permit(
          :active, :updated_by)
      end
    end
  end
end