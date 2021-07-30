module Api
  module V1
    class ChaptersController < ApplicationController
      include Swagger::ChapterApi

      before_action :set_chapter_context
      before_action :set_chapter, only: [:show, :update]

      # GET chapter_context/:id/chapters
      def index
        ch_context_name = @chapter_context.class.name
        @chapters = Chapter.where(
          sectionable_type: ch_context_name,
          sectionable_id: @chapter_context.id
        )
        @chapters = DxService.load(@chapters, params)

        render json: @chapters
      end

      # GET chapter_context/:id/chapters/1
      def show
        render json: @chapter
      end

      # POST chapter_context/:id/chapters
      def create
        @chapter = @chapter_context.chapters.new(chapter_params_to_create)

        if @chapter.save
          render json: @chapter, status: :created
        else
          render json: @chapter.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT chapter_context/:id/chapters/1
      def update
        if @chapter.update(chapter_params_to_update)
          render json: @chapter
        else
          render json: @chapter.errors, status: :unprocessable_entity
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_chapter
        @chapter = @chapter_context.chapters.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def chapter_params_to_create
        params.require(:chapter).permit(:ch_parent_id, :ch_order, :ch_title,
                                        :ch_description, :active, :created_by)
      end

      def chapter_params_to_update
        params.require(:chapter).permit(:ch_parent_id, :ch_order, :ch_title,
                                        :ch_description, :active, :updated_by)
      end
    end
  end
end