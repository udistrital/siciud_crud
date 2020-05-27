module Api
  module V1
    class CallsRequiredDocumentsController < ApplicationController
      before_action :set_call

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      def index
      end

      def create
        @call_required_document = @call.calls_required_documents.new(call_required_document)

        if @call_required_document.save
          render json: @call_required_document, status: :created
        else
          render json: @call_required_document.errors, status: :unprocessable_entity
        end
      end

      private

      def call_required_document
        params.require(:call_required_document).permit(:required_document_id,
                                                       :required)
      end

      def set_call
        @call = Call.find(params[:call_id])
      end
    end
  end
end
