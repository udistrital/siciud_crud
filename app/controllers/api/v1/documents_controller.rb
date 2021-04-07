module Api
  module V1
    class DocumentsController < ApplicationController
      before_action :set_general_context
      before_action :set_document, only: [:show, :update, :deactivate]

      # GET context/:id/documents
      def index
        context_name = @context.class.name
        @documents = CompleteDocument.where(
          product_type: context_name, product_type_id: @context.id
        )
        @documents = DxService.load(@documents, params)

        render json: @documents
      end

      # GET context/:id/documents/1
      def show
        render json: @document
      end

      # POST context/:id/documents
      def create
        @document = @context.documents.new(document_params_to_create)

        if @document.save
          render json: @document, status: :created
        else
          render json: @document.errors, status: :unprocessable_entity
        end
      end

      # PUT context/:id/documents/1
      def update
        if @document.update(document_params_to_update)
          render json: @document
        else
          render json: @document.errors, status: :unprocessable_entity
        end
      end

      # PUT context/:id/documents/1
      def deactivate
        @document.active = false
        if @document.update(document_params_to_update)
          render json: @document
        else
          render json: @document.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_document
        @document = @context.documents.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def document_params_to_create
        params.require(:document).permit(:doc_name, :doc_path, :doc_size,
                                         :document_type_id, :created_by)
      end

      def document_params_to_update
        params.require(:document).permit(:doc_name, :doc_path, :doc_size,
                                         :document_type_id, :updated_by)
      end

      def document_params_to_deactivate
        params.require(:document).permit(:active, :updated_by)
      end
    end
  end
end
