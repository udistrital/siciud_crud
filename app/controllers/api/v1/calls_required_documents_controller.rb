module Api
  module V1
    class CallsRequiredDocumentsController < ApplicationController
      before_action :set_call
      before_action :set_required_document, only: [:update, :destroy]

      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      def index
        @call_required_document = @call.calls_required_documents.order(:required_document_id)
        render json: @call_required_document, status: :ok
      end

      def create
        @call_required_document = @call.calls_required_documents.new(call_required_document)

        if @call_required_document.save
          render json: @call_required_document, status: :created
        else
          render json: @call_required_document.errors, status: :unprocessable_entity
        end
      end

      def update
        if @call_required_document.update(call_required_update_document)
          render json: @call_required_document
        else
          render json: @call_required_document.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @call_required_document.destroy
      end

      private

      def call_required_document
        params.require(:calls_required_document).permit(:required_document_id)
      end

      def call_required_update_document
        params.require(:calls_required_document).permit(:required)
      end

      def set_call
        @call = Call.find(params[:call_id])
      end

      def set_required_document
        @call_required_document = @call.calls_required_documents.find_by(id: params[:id])
        unless @call_required_document
          render json: {error: "Couldn't find call required document with 'id'=#{params[:id]}"}
        end
      end
    end
  end
end
