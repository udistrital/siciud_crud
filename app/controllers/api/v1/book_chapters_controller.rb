module Api
  module V1
    class BookChaptersController < AbstractProductResearchUnitController
      include Swagger::BookChapterApi

      before_action :set_research_group
      before_action :set_book_chapter, only: [:show, :update, :change_active]
      before_action only: [:change_active] do
        active_in_body_params? book_chap_params_to_deactivate
      end

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
          book_chapter_params_to_create)

        if @book_chapter.save
          render json: @book_chapter, status: :created
        else
          render json: @book_chapter.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /research_group/:id/book_chapters/1
      def update
        if @book_chapter.update(book_chapter_params_to_update)
          render json: @book_chapter
        else
          render json: @book_chapter.errors, status: :unprocessable_entity
        end
      end

      # PUT /research_group/:id/book_chapters/1/active
      def change_active
        if @book_chapter.update(book_chap_params_to_deactivate)
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
      def book_chapter_params_to_create
        params.require(:book_chapter).permit(:book_title, :title,
                                             :publication_date, :isbn,
                                             :doi, :url, :observation,
                                             :category_id, :colciencias_call_id,
                                             :geo_city_id, :geo_state_id, :geo_country_id,
                                             :editorial_name,
                                             :created_by)
      end

      def book_chapter_params_to_update
        params.require(:book_chapter).permit(:book_title, :title,
                                             :publication_date, :isbn,
                                             :doi, :url, :observation,
                                             :category_id, :colciencias_call_id,
                                             :geo_city_id, :geo_state_id, :geo_country_id,
                                             :editorial_name,
                                             :updated_by)
      end

      def book_chap_params_to_deactivate
        params.require(:book_chapter).permit(:active, :updated_by)
      end
    end
  end
end