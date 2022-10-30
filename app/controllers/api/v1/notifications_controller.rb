module Api
  module V1
    class NotificationsController < ApplicationController
      include Swagger::NotificationApi

      # POST /notifications
      def health_check
        NotificationMailer.with(health_check_params).health_check.deliver
        render json: { service: "OK" }, status: :ok
      end

      def custom_notification
        NotificationMailer.with(custom_notification_params).custom_notification.deliver
        render json: { send_mail: "OK" }, status: :ok
      end

      private

      def health_check_params
        params.require(:notification).permit(to: [],
                                             cc: [])
      end

      def custom_notification_params
        params.require(:notification).permit(:body,
                                             :subject,
                                             to: [],
                                             cc: [])
      end
    end
  end
end