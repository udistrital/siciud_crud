module Api
  module V1
    class NewScientificRecordsController < AbstractProductResearchUnitController
      before_action :set_research_group
      before_action :set_new_scientific_record, only: [:show, :update, :change_active]
      before_action only: [:change_active] do
        active_in_body_params? nsr_params_to_deactivate
      end

      # GET /research_units/:id/new_scientific_records
      def index
        @new_scientific_records = CompleteNewScientificRecord.where(
          research_group_id: params[:research_group_id]
        )
        @new_scientific_records = DxService.load(@new_scientific_records,
                                                 params)

        render json: @new_scientific_records
      end

      # GET /research_units/:id/new_scientific_records/1
      def show
        render json: @new_scientific_record
      end

      # POST /research_units/:id/new_scientific_records
      def create
        @new_scientific_record = @research_group.new_scientific_records.new(
          nsr_params_to_create)

        if @new_scientific_record.save
          render json: @new_scientific_record, status: :created
        else
          render json: @new_scientific_record.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_units/:id/new_scientific_records/1
      def update
        if @new_scientific_record.update(nsr_params_to_update)
          render json: @new_scientific_record
        else
          render json: @new_scientific_record.errors, status: :unprocessable_entity
        end
      end

      # PUT /research_units/:id/industrial_designs/1/active
      def change_active
        if @new_scientific_record.update(nsr_params_to_deactivate)
          render json: @new_scientific_record
        else
          render json: @new_scientific_record.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_new_scientific_record
        @new_scientific_record = NewScientificRecord.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def nsr_params_to_create
        params.require(:new_scientific_record).permit(
          :nsr_name, :nsr_date_of_obtaining, :nsr_database_name, :nsr_database_url,
          :geo_city_id, :category_id, :research_group_id, :colciencias_call_id,
          :nsr_certifying_institution, :nsr_issuing_institution, :observation,
          :created_by)
      end

      def nsr_params_to_update
        params.require(:new_scientific_record).permit(
          :nsr_name, :nsr_date_of_obtaining, :nsr_database_name, :nsr_database_url,
          :geo_city_id, :category_id, :research_group_id, :colciencias_call_id,
          :nsr_certifying_institution, :nsr_issuing_institution, :observation,
          :updated_by)
      end

      def nsr_params_to_deactivate
        params.require(:new_scientific_record).permit(
          :active, :updated_by)
      end
    end
  end
end