module Api
  module V1
    class SoftwareController < AbstractProductResearchUnitController
      before_action :set_research_group
      before_action :set_software, only: [:show, :update, :change_active]
      before_action only: [:change_active] do
        active_in_body_params? software_params_to_deactivate
      end

      # GET /research_units/:id/software
      def index
        @software = CompleteSoftware.where(
          research_group_id: params[:research_group_id]
        )
        @software = DxService.load(@software, params)

        render json: @software
      end

      # GET /research_units/:id/software/1
      def show
        render json: @software
      end

      # POST /research_units/:id/software
      def create
        @software = @research_group.software.new(software_params_to_create)

        if @software.save
          render json: @software, status: :created
        else
          render json: @software.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_units/:id/software/1
      def update
        if @software.update(software_params_to_update)
          render json: @software
        else
          render json: @software.errors, status: :unprocessable_entity
        end
      end

      # PUT /research_units/:id/industrial_designs/1/active
      def change_active
        if @software.update(software_params_to_deactivate)
          render json: @software
        else
          render json: @software.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_software
        @software = @research_group.software.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def software_params_to_create
        params.require(:software).permit(
          :sof_registration_number, :sof_product_title, :sof_date_of_obtaining,
          :geo_country_id, :sof_description, :category_id, :colciencias_call_id,
          :observation, :created_by)
      end

      def software_params_to_update
        params.require(:software).permit(
          :sof_registration_number, :sof_product_title, :sof_date_of_obtaining,
          :geo_country_id, :sof_description, :category_id, :colciencias_call_id,
          :observation, :updated_by)
      end

      def software_params_to_deactivate
        params.require(:software).permit(
          :active, :updated_by)
      end
    end
  end
end