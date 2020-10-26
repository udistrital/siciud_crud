module Api
  module V1
    class BooksController < ApplicationController
      before_action :set_book, only: [:show, :update, :attach]

      # Handling of database exceptions
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      # GET /books
      def index
        @books = Book.all

        render json: @books
      end

      # GET /books/1
      def show
        render json: @book
      end

      # POST /books
      def create
        @book = Book.new(book_params)
        params.permit(:editorial_name)
        editorial_name = params[:book][:editorial_name]
        editorial = Editorial.where('lower(name) = ?', editorial_name.downcase).first
        if editorial.nil?
          editorial = Editorial.new(name: editorial_name)
          if !editorial.save
            render json: editorial.errors, status: :unprocessable_entity
          end
        end
        @book.editorial = editorial
        if @book.save
          render json: @book, status: :created
        else
          render json: @book.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /books/1
      def update
        if @book.update(book_params)
          render json: @book
        else
          render json: @book.errors, status: :unprocessable_entity
        end
      end

      # PUT /books/1/attach
      def attach
        params.permit(:book_document)
        if (file = params[:book_document])
          if (file.content_type == "application/pdf")
            @research_creation_work.book_document.attach(file)
          else
            return render json: {'error': 'El acta del cidc debe ser formato pdf.'},
                          status: :unprocessable_entity
          end
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_book
        @book = Book.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def book_params
        params.require(:book).permit(:title, :publication_date, :isbn, :url,
                                     :observation, :category_id,
                                     # :editorial_id,
                                     :research_group_id)
      end
    end
  end
end
