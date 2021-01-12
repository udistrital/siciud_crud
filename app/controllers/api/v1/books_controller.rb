module Api
  module V1
    class BooksController < AbstractProductResearchUnitController
      include Swagger::BookApi

      before_action :set_research_group, only: [:index, :show, :create, :update]
      before_action :set_book, only: [:show, :update]

      # GET /research_group/:id/books
      def index
        books_by_ru = CompleteBook.where(
            research_group_id: params[:research_group_id])
        @books = DxService.load(books_by_ru, params)
        render json: @books
      end

      # GET /research_group/:id/books/1
      def show
        render json: @book
      end

      # POST /research_group/:id/books
      def create
        @book = @research_group.books.new(
            book_params.except(:editorial_name)
        )

        editorial = set_editorial(params[:book][:editorial_name],
                                  @book.created_by, @book.updated_by)
        if editorial
          @book.editorial = editorial
        else
          return
        end

        if @book.save
          render json: @book, status: :created
        else
          render json: @book.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_group/:id/books/1
      def update
        editorial = set_editorial(params[:book][:editorial_name],
                                  @book.created_by, @book.updated_by)
        if editorial
          @book.editorial = editorial
        else
          return
        end

        if @book.created_by.nil?
          # Update user of created_by only this is nil
          if @book.update(book_params.except(:editorial_name))
            render json: @book
          else
            render json: @book.errors, status: :unprocessable_entity
          end
        else
          if @book.update(book_params.except(:editorial_name, :created_by))
            render json: @book
          else
            render json: @book.errors, status: :unprocessable_entity
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
                                     :geo_city_id, :book_document,
                                     :editorial_name, :active,
                                     :created_by, :updated_by)
      end
    end
  end
end
