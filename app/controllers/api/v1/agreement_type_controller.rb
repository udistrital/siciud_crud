module Api
  module V1
    class AgreementTypeController < ApplicationController
      before_action :set_agreement_types, only: [:show]
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: { error: e.message }, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: { error: e.message }, status: :unprocessable_entity
      end

      def index
        @agreement_types = AgreementType.all.order(:created_at)
        render json: @agreement_types
      end

      def show
        render json: @agreement_type
      end

      def create
        @agreement_type = AgreementType.new(agreement_type_params)
        if @agreement_type.save
          render json: @agreement_type, status: :created
        else
          render json: @agreement_type.errors, status: :unprocessable_entity
        end
      end

      private

      def set_agreement_types
        @agreement_type = AgreementType.find(params[:id])
      end

      def agreement_type_params
        params.require(:agreement_type).permit(:name)
      end
    end
  end
end
