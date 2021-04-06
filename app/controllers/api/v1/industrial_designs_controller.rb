module Api
  module V1
    class IndustrialDesignsController < AbstractProductResearchUnitController
      before_action :set_research_group
      before_action :set_industrial_design, only: [:show, :update, :change_active]
      before_action only: [:change_active] do
        active_in_body_params? ind_design_params_to_deactivate
      end

      # GET /research_units/:id/industrial_designs
      def index
        @industrial_designs = CompleteIndustrialDesign.where(
          research_group_id: params[:research_group_id]
        )
        @industrial_designs = DxService.load(@industrial_designs, params)

        render json: @industrial_designs
      end

      # GET /research_units/:id/industrial_designs/1
      def show
        render json: @industrial_design
      end

      # POST /research_units/:id/industrial_designs
      def create
        @industrial_design = @research_group.industrial_designs.new(
          ind_design_params_to_create)

        if @industrial_design.save
          render json: @industrial_design, status: :created
        else
          render json: @industrial_design.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_units/:id/industrial_designs/1
      def update
        if @industrial_design.update(ind_design_params_to_update)
          render json: @industrial_design
        else
          render json: @industrial_design.errors, status: :unprocessable_entity
        end
      end

      # PUT /research_units/:id/industrial_designs/1/active
      def change_active
        if @industrial_design.update(book_params_to_deactivate)
          render json: @industrial_design
        else
          render json: @industrial_design.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_industrial_design
        @industrial_design = @research_group.industrial_designs.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def ind_design_params_to_create
        params.require(:industrial_design).permit(
          :ind_dsg_registration_number, :ind_dsg_registration_title,
          :ind_dsg_date_of_obtaining, :geo_country_id, :observation,
          :ind_dsg_industrial_publication_gazette, :category_id,
          :colciencias_call_id, :created_by)
      end

      def ind_design_params_to_update
        params.require(:industrial_design).permit(
          :ind_dsg_registration_number, :ind_dsg_registration_title,
          :ind_dsg_date_of_obtaining, :geo_country_id, :observation,
          :ind_dsg_industrial_publication_gazette, :category_id,
          :colciencias_call_id, :updated_by)
      end

      def ind_design_params_to_deactivate
        params.require(:industrial_design).permit(
          :active, :updated_by)
      end
    end
  end
end
