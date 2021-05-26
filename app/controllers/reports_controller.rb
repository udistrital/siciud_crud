module Api
  module V1
    class ReportsController < AbstractProductResearchUnitController
      before_action :set_research_group, only: [:index, :create]
      before_action :set_report, only: [:show, :update]

      # GET /research_units/:id/reports
      def index
        if params[:product_type_id]
          @reports = CompleteReport.where(
            "research_group_id = ? AND product_type_id = ?",
            params[:research_group_id], params[:product_type_id]
          )
        else
          @reports = CompleteReport.where(
            research_group_id: params[:research_group_id]
          )
        end
        @reports = DxService.load(@reports, params)

        render json: @reports
      end

      # GET /reports/1
      def show
        render json: @report
      end

      # POST /research_units/:id//reports
      def create
        @report = @research_group.reports.new(report_params_to_create)

        if @report.save
          render json: @report, status: :created
        else
          render json: @report.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /reports/1
      def update
        if @report.update(report_params_to_update)
          render json: @report
        else
          render json: @report.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_report
        @report = Report.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def report_params_to_create
        params.require(:report).permit(:name, :project_name, :date_of_elaboration,
                                       :geo_city_id, :geo_state_id, :geo_country_id,
                                       :category_id, :product_type_id,
                                       :research_group_id, :colciencias_call_id,
                                       :observation, :active, :created_by)
      end

      def report_params_to_update
        params.require(:report).permit(:name, :project_name, :date_of_elaboration,
                                       :geo_city_id, :geo_state_id, :geo_country_id,
                                       :category_id, :product_type_id,
                                       :research_group_id, :colciencias_call_id,
                                       :observation, :active, :updated_by)
      end
    end
  end
end