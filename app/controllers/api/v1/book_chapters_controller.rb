module Api
  module V1
    class BookChaptersController < AbstractProductResearchUnitController
      before_action only: [:create] do
        validate_created_by(book_chapter_params)
      end
      before_action only: [:create, :update] do
        validate_updated_by(book_chapter_params)
      end

      before_action :set_research_group, only: [:index, :show, :create, :update]
      before_action :set_book_chapter, only: [:show, :update]

      # GET /research_group/:id/book_chapters
      def index
        @book_chapters = DxService.load(CompleteBookChapter, params)
        render json: @book_chapters
      end

      # GET /research_group/:id/book_chapters/1
      def show
        render json: @book_chapter
      end

      # POST /research_group/:id/book_chapters
      def create
        @book_chapter = @research_group.book_chapters.new(
            book_chapter_params.except(:editorial_name, :created_by,
                                       :updated_by)
        )

        # Add user in created_by and updated_by
        @book_chapter.created_by = @created_by_user
        @book_chapter.updated_by = @updated_by_user

        editorial = set_editorial(params[:book_chapter][:editorial_name],
                                  @book_chapter.created_by,
                                  @book_chapter.updated_by)
        if editorial
          @book_chapter.editorial = editorial
        else
          return
        end

        if @book_chapter.save
          render json: @book_chapter, status: :created
        else
          render json: @book_chapter.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_group/:id/book_chapters/1
      def update
        # Update user of updated_by
        @book_chapter.updated_by = @updated_by_user

        editorial = set_editorial(params[:book_chapter][:editorial_name],
                                  @book_chapter.created_by,
                                  @book_chapter.updated_by)
        if editorial
          @book_chapter.editorial = editorial
        else
          return
        end

        if @book_chapter.update(book_chapter_params.except(:editorial_name,
                                                           :created_by,
                                                           :updated_by)
        )
          render json: @book_chapter
        else
          render json: @book_chapter.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_book_chapter
        @book_chapter = @research_group.book_chapters.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def book_chapter_params
        params.require(:book_chapter).permit(:book_title, :title,
                                             :publication_date, :isbn,
                                             :doi, :url, :observation,
                                             :category_id, :geo_city_id,
                                             :editorial_name,
                                             :book_chapter_document, :active,
                                             :created_by, :updated_by)
      end
    end
  end
end