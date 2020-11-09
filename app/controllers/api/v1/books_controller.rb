module Api
  module V1
    class BooksController < AbstractProductResearchUnitController
      before_action :set_research_group
      before_action :set_book, only: [:show, :update, :attach]

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
        editorial = set_editorial(params[:book][:editorial_name])
        if editorial
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
          if file.content_type == "application/pdf"
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
        @book = @research_group.books.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def book_params
        params.require(:book).permit(:title, :publication_date, :isbn,
                                     :url, :observation, :category_id,
                                     :geo_city_id)
      end
    end
  end
end
