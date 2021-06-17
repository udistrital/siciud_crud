module Api
  module V1
    class SimpleBooksController < AbstractProductResearchUnitController
      include Swagger::SimpleBookApi

      before_action :set_research_group, only: [:index, :create]
      before_action :set_simple_book, only: [:show, :update]

      # GET /research_units/:id/simple_books
      def index
        if params[:product_type_id]
          @simple_books = CompleteSimpleBook.where(
            "research_group_id = ? AND product_type_id = ?",
            params[:research_group_id], params[:product_type_id]
          )
        else
          @simple_books = CompleteSimpleBook.where(
            research_group_id: params[:research_group_id])
        end
        @simple_books = DxService.load(@simple_books, params)

        render json: @simple_books
      end

      # GET /simple_books/1
      def show
        render json: @simple_book
      end

      # POST /research_units/:id/simple_books
      def create
        @simple_book = @research_group.simple_books.new(simple_book_params_to_create)

        if @simple_book.save
          render json: @simple_book, status: :created
        else
          render json: @simple_book.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /simple_books/1
      def update
        if @simple_book.update(simple_book_params_to_update)
          render json: @simple_book
        else
          render json: @simple_book.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_simple_book
        @simple_book = SimpleBook.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def simple_book_params_to_create
        params.require(:simple_book).permit(:isbn, :title, :publication_date,
                                            :url, :editorial_name, :geo_city_id,
                                            :geo_state_id, :geo_country_id, :category_id,
                                            :product_type_id, :research_group_id,
                                            :colciencias_call_id, :observation,
                                            :active, :created_by)
      end

      def simple_book_params_to_update
        params.require(:simple_book).permit(:isbn, :title, :publication_date,
                                            :url, :editorial_name, :geo_city_id,
                                            :geo_state_id, :geo_country_id, :category_id,
                                            :product_type_id, :research_group_id,
                                            :colciencias_call_id, :observation,
                                            :active, :updated_by)
      end
    end
  end
end