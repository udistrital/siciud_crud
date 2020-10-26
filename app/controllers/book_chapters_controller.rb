class BookChaptersController < ApplicationController
  before_action :set_book_chapter, only: [:show, :update, :destroy]

  # GET /book_chapters
  def index
    @book_chapters = BookChapter.all

    render json: @book_chapters
  end

  # GET /book_chapters/1
  def show
    render json: @book_chapter
  end

  # POST /book_chapters
  def create
    @book_chapter = BookChapter.new(book_chapter_params)

    if @book_chapter.save
      render json: @book_chapter, status: :created, location: @book_chapter
    else
      render json: @book_chapter.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /book_chapters/1
  def update
    if @book_chapter.update(book_chapter_params)
      render json: @book_chapter
    else
      render json: @book_chapter.errors, status: :unprocessable_entity
    end
  end

  # DELETE /book_chapters/1
  def destroy
    @book_chapter.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_chapter
      @book_chapter = BookChapter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_chapter_params
      params.require(:book_chapter).permit(:book_title, :title, :publication_date, :isbn, :doi, :url, :observation, :category_id, :editorial_id, :research_group_id)
    end
end
