module Api
  module V1
    class BookChaptersController < AbstractProductResearchUnitController
      include Swagger::BookChapterApi

      before_action :set_research_group, only: [:index, :show, :create, :update]
      before_action :set_book_chapter, only: [:show, :update]

      # GET /research_group/:id/book_chapters
      def index
        book_chapters_by_ru = CompleteBookChapter.where(
            research_group_id: params[:research_group_id])
        @book_chapters = DxService.load(book_chapters_by_ru, params)
        render json: @book_chapters
      end

      # GET /research_group/:id/book_chapters/1
      def show
        render json: @book_chapter
      end

      # POST /research_group/:id/book_chapters
      def create
        @book_chapter = @research_group.book_chapters.new(
            book_chapter_params.except(:editorial_name)
        )

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
        editorial = set_editorial(params[:book_chapter][:editorial_name],
                                  @book_chapter.created_by,
                                  @book_chapter.updated_by)
        if editorial
          @book_chapter.editorial = editorial
        else
          return
        end

        if @book_chapter.created_by.nil?
          # Update user of created_by only this is nil
          if @book_chapter.update(book_chapter_params.except(:editorial_name))
            render json: @book_chapter
          else
            render json: @book_chapter.errors, status: :unprocessable_entity
          end
        else
          if @book_chapter.update(book_chapter_params.except(:editorial_name,
                                                             :created_by))
            render json: @book_chapter
          else
            render json: @book_chapter.errors, status: :unprocessable_entity
          end
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