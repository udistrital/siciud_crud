module Api
  module V1
    class BookChaptersController < AbstractProductResearchUnitController
      before_action :set_research_group
      before_action :set_book_chapter, only: [:show, :update, :attach]

      # GET /research_group/:id/book_chapters
      def index
        @book_chapters = @research_group.book_chapters
        render json: @book_chapters
      end

      # GET /research_group/:id/book_chapters/1
      def show
        render json: @book_chapter
      end

      # POST /research_group/:id/book_chapters
      def create
        @book_chapter = @research_group.book_chapters.new(book_chapter_params)
        editorial = set_editorial(params[:book_chapter][:editorial_name])
        if editorial
          @book_chapter.editorial = editorial
        end

        if @book_chapter.save
          render json: @book_chapter, status: :created
        else
          render json: @book_chapter.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_group/:id/book_chapters/1
      def update
        if @book_chapter.update(book_chapter_params)
          render json: @book_chapter
        else
          render json: @book_chapter.errors, status: :unprocessable_entity
        end
      end

      # PUT /research_group/:id/book_chapters/1/attach
      def attach
        params.permit(:book_chapter_document)
        if (file = params[:book_chapter_document])
          if file.content_type == "application/pdf"
            @book_chapter.book_chapter_document.attach(file)
          else
            return render json: {'error': 'El capítulo del libro debe ser formato pdf.'},
                          status: :unprocessable_entity
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
                                             :category_id, :geo_city_id)
      end
    end
  end
end