module Api
  module V1
    class ResearchGroupController < ApplicationController
      include Swagger::ResearchUnitApi

      before_action :set_research_group, only: [:show, :update]

      # Handling of database exceptions
      rescue_from ActiveRecord::StatementInvalid do |e|
        render json: { error: e.message }, status: :unprocessable_entity
      end

      # GET /research_units
      def index
        @research_groups = DxService.load(ResearchUnit, params)
        @rg_data = @research_groups[:data]
        if @rg_data.is_a? ActiveRecord::Relation
          @research_groups[:data] = @rg_data.select(@rg_data.column_names - ["member_documents"])
        end
        render json: @research_groups
      end

      # GET /research_units/:id
      def show
        render json: @research_group
      end

      # POST /research_units/:id
      def create
        ResearchGroup.transaction do
          @research_group = ResearchGroup.new(
            research_group_params.except(:cine_detailed_area_ids,
                                         :curricular_project_ids,
                                         :faculty_ids,
                                         :research_focus_ids,
                                         :oecd_discipline_ids,
                                         :updated_by)
          )
          @research_group = pre_save_data_by_key(@research_group)

          unless @research_group.valid?
            render json: @research_group.errors, status: :unprocessable_entity and return
          end

          if @research_group.save
            @research_group = pos_save_data_by_key(@research_group)
            render json: @research_group, status: :created
          else
            render json: @research_group.errors, status: :unprocessable_entity
          end
        end
      end

      # PUT /research_units/:id
      def update
        if @research_group.update(
          research_group_params.except(:cine_detailed_area_ids,
                                       :curricular_project_ids,
                                       :faculty_ids,
                                       :research_focus_ids,
                                       :oecd_discipline_ids,
                                       :created_by))
          @research_group = pre_save_data_by_key(@research_group)
          @research_group = pos_save_data_by_key(@research_group)

          if @research_group.save
            render json: @research_group
          else
            render json: @research_group.errors, status: :unprocessable_entity
          end
        else
          render json: @research_group.errors, status: :unprocessable_entity
        end
      end

      private

      def pre_save_data_by_key(research_gr)
        if params[:research_group].has_key?(:faculty_ids)
          research_gr = setFaculties(
            (params[:research_group][:faculty_ids]).uniq,
            research_gr)
        end
        if params[:research_group].has_key?(:curricular_project_ids)
          research_gr = setCurricularPrj(
            (params[:research_group][:curricular_project_ids]).uniq,
            research_gr)
        end
        return research_gr
      end

      def pos_save_data_by_key(research_gr)
        if params[:research_group].has_key?(:oecd_discipline_ids)
          research_gr.oecd_discipline_ids = (params[:research_group][:oecd_discipline_ids]).map(&:to_i).uniq
        end
        if params[:research_group].has_key?(:cine_detailed_area_ids)
          research_gr.cine_detailed_area_ids = (params[:research_group][:cine_detailed_area_ids]).map(&:to_i).uniq
        end
        if params[:research_group].has_key?(:research_focus_ids)
          research_gr.research_focus_ids = (params[:research_group][:research_focus_ids]).map(&:to_i).uniq
        end
        research_gr
      end

      def setFaculties(faculties, research_gr)
        research_gr.faculty_ids_research_groups.destroy_all
        faculties.map do |faculty|
          research_gr.faculty_ids_research_groups.new(faculty_id: faculty)
        end
        research_gr
      end

      def setCurricularPrj(curricularprjs, research_gr)
        research_gr.curricular_prj_ids_research_groups.destroy_all
        curricularprjs.map do |curr|
          research_gr.curricular_prj_ids_research_groups.new(curricular_project_id: curr)
        end
        research_gr
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_research_group
        @research_group = ResearchGroup.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def research_group_params
        params.require(:research_group).permit(:name, :acronym, :description,
                                               :cidc_registration_date,
                                               :cidc_act_number,
                                               :faculty_act_number,
                                               :faculty_registration_date,
                                               :group_state_id,
                                               :email, :gruplac, :webpage,
                                               :interinstitutional,
                                               :mission, :vision,
                                               :cine_broad_area_id,
                                               :cine_specific_area_id,
                                               :colciencias_code,
                                               :group_type_id, :snies_id,
                                               :oecd_knowledge_subarea_id,
                                               :oecd_knowledge_area_id,
                                               :legacy_siciud_id,
                                               :parent_id,
                                               :created_by, :updated_by,
                                               cine_detailed_area_ids: [],
                                               curricular_project_ids: [],
                                               faculty_ids: [],
                                               research_focus_ids: [],
                                               oecd_discipline_ids: [])
      end
    end
  end
end