module Api
  module V1
    class ApManagementReportsController < ApplicationController
      include Swagger::ApManagementReportApi

      before_action :set_ap_management_report, only: [:update]

      # PATCH/PUT /ap_management_reports/1
      def update
        result = ApManagementReportService.is_upgradeable(@ap_management_report,
                                                          act_plan_params_to_update)
        if result[:is_upgradeable]
          if ApManagementReportService.is_publishable(@ap_management_report, act_plan_params_to_update)
            @ap_management_report.management_report_published_at = DateTime.now
          end
          if @ap_management_report.update(act_plan_params_to_update)
            render json: @ap_management_report
          else
            render json: @ap_management_report.errors, status: :unprocessable_entity
          end
        else
          render json: { error: result[:msg] },
                 status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_ap_management_report
        @ap_management_report = ActionPlan.find(params[:id])
      end

      def act_plan_params_to_update
        params.require(:ap_management_report).permit(:management_report_is_draft,
                                                     :updated_by)
      end
    end
  end
end