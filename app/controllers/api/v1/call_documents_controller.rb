module Api
  module V1
    class CallDocumentsController < AbstractCallController
      include Swagger::CallDocumentApi

      before_action :set_call, only: [:create]
      before_action :set_call_document, only: [:show, :update]

      # GET /call_documents
      def index
        @call_documents = CompleteCallDocument.where(
          "call_id = ?", params[:call_id]
        )
        @call_documents = DxService.load(@call_documents, params)

        render json: @call_documents
      end

      # GET /call_documents/1
      def show
        render json: @call_document
      end

      # POST /call_documents
      def create
        @call_document = @call.call_documents.new(call_document_params_to_create)

        if @call_document.save
          render json: @call_document, status: :created
        else
          render json: @call_document.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /call_documents/1
      def update
        if @call_document.update(call_document_params_to_update)
          render json: @call_document
        else
          render json: @call_document.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_call_document
        @call_document = CallDocument.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def call_document_params_to_create
        params.require(:call_document).permit(:document_id,
                                              :cd_required, :active,
                                              :created_by)
      end

      def call_document_params_to_update
        params.require(:call_document).permit(:call_id, :document_id,
                                              :cd_required, :active,
                                              :updated_by)
      end
    end
  end
end