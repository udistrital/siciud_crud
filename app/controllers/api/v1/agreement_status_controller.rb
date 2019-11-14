module Api
  module V1
    class AgreementStatusController < ApplicationController
      before_action :set_agreement_status, only: [:show]
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: { error: e.message }, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: { error: e.message }, status: :unprocessable_entity
      end

      def index
        @agreement_statuses = AgreementStatus.all.order(:created_at)
        render json: @agreement_statuses
      end

      def show
        render json: @agreement_status
      end

      private

      def set_agreement_status
        @agreement_status = AgreementStatus.find(params[:id])
      end
    end
  end
end

