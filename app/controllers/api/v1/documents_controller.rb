module Api
  module V1
    class DocumentsController < ApplicationController
      before_action :set_context_product
      before_action :set_document, only: [:show, :update, :deactivate]

      # GET context/:id/documents
      def index
        @documents = @context.documents.all.order(:id)

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
        @document = Document.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def document_params_to_create
        params.require(:document).permit(:doc_name, :doc_path, :doc_size,
                                         :document_type_id, :created_by)
      end

      def document_params_to_update
        params.require(:document).permit(:doc_name, :doc_path, :doc_size,
                                         :document_type_id, :updated_by_id)
      end

      def document_params_to_deactivate
        params.require(:document).permit(:updated_by_id)
      end

      def set_context_product
        if params[:book_id]
          id = params[:book_id]
          @context = Book.find(id)
        elsif params[:book_chapter_id]
          id = params[:book_chapter_id]
          @context = BookChapter.find(id)
        elsif params[:ip_livestock_breed_id]
          id = params[:ip_livestock_breed_id]
          @context = IpLivestockBreed.find(id)
        elsif params[:new_animal_breed_id]
          id = params[:new_animal_breed_id]
          @context = NewAnimalBreed.find(id)
        elsif params[:paper_id]
          id = params[:paper_id]
          @context = Paper.find(id)
        elsif params[:patent_id]
          id = params[:patent_id]
          @context = Patent.find(id)
        elsif params[:research_creation_work_id]
          id = params[:research_creation_work_id]
          @context = ResearchCreationWork.find(id)
        elsif params[:scientific_note_id]
          id = params[:scientific_note_id]
          @context = ScientificNote.find(id)
        elsif params[:vegetable_variety_id]
          id = params[:vegetable_variety_id]
          @context = VegetableVariety.find(id)
        end
      end

    end
  end
end
