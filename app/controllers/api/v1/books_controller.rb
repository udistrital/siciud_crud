module Api
  module V1
    class BooksController < ApplicationController
      before_action :set_research_group
      before_action :set_book, only: [:show, :update, :attach]

      # Handling of database exceptions
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      # GET /research_group/:id/books
      def index
        @books = @research_group.books
        render json: @books
      end

      # GET /research_group/:id/books/1
      def show
        render json: @book
      end

      # POST /research_group/:id/books
      def create
        @book = @research_group.books.new(book_params)

        params.permit(:editorial_name)
        editorial_name = params[:book][:editorial_name]
        if editorial_name.is_a? String
          editorial_name = editorial_name.strip
          editorial = Editorial.where('lower(name) = ?', editorial_name.downcase).first
          if editorial.nil?
            editorial = Editorial.new(name: editorial_name)
            if !editorial.save
              render json: editorial.errors, status: :unprocessable_entity
            end
          end
          @book.editorial = editorial
        end
        if @book.save
          render json: @book, status: :created
        else
          render json: @book.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_group/:id/books/1
      def update
        if @book.update(book_params)
          render json: @book
        else
          render json: @book.errors, status: :unprocessable_entity
        end
      end

      # PUT /research_group/:id/books/1/attach
      def attach
        params.permit(:book_document)
        if (file = params[:book_document])
          if (file.content_type == "application/pdf")
            @book.book_document.attach(file)
          else
            return render json: {'error': 'El libro debe ser formato pdf.'},
                          status: :unprocessable_entity
          end
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_book
        @book = Book.find(params[:id])
      end

      def set_research_group
        @research_group = ResearchGroup.find(params[:research_group_id])
      end

      # Only allow a trusted parameter "white list" through.
      def book_params
        params.require(:book).permit(:title, :publication_date, :isbn, :url,
                                     :observation, :category_id)
      end
    end
  end
end
