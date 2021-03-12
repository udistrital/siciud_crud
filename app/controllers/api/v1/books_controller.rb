module Api
  module V1
    class BooksController < AbstractProductResearchUnitController
      include Swagger::BookApi

      before_action :set_research_group
      before_action :set_book, only: [:show, :update, :change_active]
      before_action only: [:change_active] do
        active_in_body_params? book_params_to_deactivate
      end

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
        @book = @research_group.books.new(book_params_to_create)

        editorial = set_editorial(params[:book][:editorial_name],
                                  @book.created_by)
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

      # PUT /research_group/:id/books/1
      def update
        editorial = set_editorial(params[:book][:editorial_name],
                                  @book.created_by)
        if editorial
          @book.editorial = editorial
        else
          return
        end

        if @book.update(book_params_to_update)
          render json: @book
        else
          render json: @book.errors, status: :unprocessable_entity
        end
      end

      # PUT /research_group/:id/books/1/active
      def change_active
        if @book.update(book_params_to_deactivate)
          render json: @book
        else
          render json: @book.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_book
        @book = @research_group.books.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def book_params_to_create
        params.require(:book).permit(:title, :publication_date, :isbn,
                                     :url, :observation, :category_id,
                                     :geo_city_id, :created_by)
      end

      def book_params_to_update
        params.require(:book).permit(:title, :publication_date, :isbn,
                                     :url, :observation, :category_id,
                                     :geo_city_id, :updated_by)
      end

      def book_params_to_deactivate
        params.require(:book).permit(:active, :updated_by)
      end
    end
  end
end
