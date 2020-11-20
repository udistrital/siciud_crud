module Api
  module V1
    class BooksController < AbstractProductResearchUnitController
      before_action only: [:create] do
        validate_created_by(book_params)
      end
      before_action only: [:create, :update] do
        validate_updated_by(book_params)
      end
      before_action :set_research_group, only: [:index, :show, :create, :update]
      before_action :set_book, only: [:show, :update]

      # GET /research_group/:id/books
      def index
        @books = DxService.load(CompleteBook, params)
        render json: @books
      end

      # GET /research_group/:id/books/1
      def show
        render json: @book
      end

      # POST /research_group/:id/books
      def create
        @book = @research_group.books.new(
            book_params.except(:editorial_name, :created_by, :updated_by)
        )

        # Add user in created_by and updated_by
        @book.created_by = @created_by_user
        @book.updated_by = @updated_by_user

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
        # Update user of updated_by
        @book.updated_by = @updated_by_user

        editorial = set_editorial(params[:book][:editorial_name],
                                  @book.created_by, @book.updated_by)
        if editorial
          @book.editorial = editorial
        else
          return
        end
        if @book.update(book_params.except(:editorial_name, :created_by,
                                           :updated_by))
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
