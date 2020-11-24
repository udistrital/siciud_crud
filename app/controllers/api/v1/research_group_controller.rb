module Api
  module V1
    class ResearchGroupController < ApplicationController
      before_action only: [:create, :update] do
        validate_created_by(research_group_params)
        validate_updated_by(research_group_params)
      end
      before_action :set_research_group, only: [:show, :update, :attach]

      # Handling of database exceptions
      rescue_from ActiveRecord::StatementInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      def index
        @research_groups = ResearchGroup.joins(:group_type, :group_state)
        if (gt_id = params[:group_type_id])
          @research_groups = ResearchGroupsSearchService.filter_by_type(
              @research_groups, gt_id)
        end
        if (filter = params[:filter])
          filter = ResearchGroupsSearchService.str2array_and_remove_str(
              filter, ['"or",'])
          @research_groups = ResearchGroupsSearchService.search_with_query(
              @research_groups, filter)
        end

        if (group = params[:group])
          group = ResearchGroupsSearchService.str2array_direct(group)
          response = ResearchGroupsSearchService.group_with_query(@research_groups, group, [])
          render json: {'totalCount': @research_groups.count,
                        'data': response}
        else
          if (sort = params[:sort])
            order_list = ResearchGroupsSearchService.str2array_direct(sort)
            @research_groups = ResearchGroupsSearchService.sort_with_query(
                @research_groups, order_list)
          end

          if params[:skip] and params[:take] != 0
            page = ((params[:skip].to_i / params[:take].to_i) + 1)
            aux = @research_groups.paginate(:page => page,
                                            :per_page => params[:take])
          else
            aux = @research_groups
          end
          render json: {'totalCount': @research_groups.count,
                        'data': ActiveModelSerializers::SerializableResource.new(aux)}
        end
      end

      def show
        render json: @research_group
      end

      def create
        @research_group = ResearchGroup.new(research_group_params)

        params.permit(:faculty_ids, :curricular_project_ids)
        @research_group = save_data_by_key(@research_group)

        if @research_group.save
          render json: @research_group, status: :created
        else
          render json: @research_group.errors, status: :unprocessable_entity
        end
      end

      def update
        if @research_group.created_by.nil?
          # Update user of created_by only this is nil
          if @research_group.update(research_group_params)
            params.permit(:faculty_ids, :curricular_project_ids)
            @research_group = save_data_by_key(@research_group)

            if @research_group.save
              render json: @research_group
            else
              render json: @research_group.errors, status: :unprocessable_entity
            end
          else
            render json: @research_group.errors, status: :unprocessable_entity
          end
        else
          if @research_group.update(research_group_params.except(:created_by))
            params.permit(:faculty_ids, :curricular_project_ids)
            @research_group = save_data_by_key(@research_group)

            if @research_group.save
              render json: @research_group
            else
              render json: @research_group.errors, status: :unprocessable_entity
            end
          else
            render json: @research_group.errors, status: :unprocessable_entity
          end
        end
      end

      private

      def save_data_by_key(research_gr)
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
        if params[:research_group].has_key?(:oecd_discipline_ids)
          research_gr.oecd_discipline_ids = (params[:research_group][:oecd_discipline_ids]).map(&:to_i).uniq
        end
        if params[:research_group].has_key?(:cine_detailed_area_ids)
          research_gr.cine_detailed_area_ids = (params[:research_group][:cine_detailed_area_ids]).map(&:to_i).uniq
        end
        research_gr
      end

      def setFaculties(faculties, research_gr)
        research_gr.faculty_ids_research_groups.destroy_all
        faculties.map do |faculty|
          new_faculty = research_gr.faculty_ids_research_groups.new(faculty_id: faculty)
          if new_faculty.valid?
            new_faculty.save
          end
        end
        research_gr
      end

      def setCurricularPrj(curricularprjs, research_gr)
        research_gr.curricular_prj_ids_research_groups.destroy_all
        curricularprjs.map do |curr|
          new_curr = research_gr.curricular_prj_ids_research_groups.new(curricular_project_id: curr)
          if new_curr.valid?
            new_curr.save
          end
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
                                               :created_by, :updated_by,
                                               :cidc_act_document, :establishment_document,
                                               :faculty_act_document,
                                               research_focus_ids: [],
                                               oecd_discipline_ids: [])
      end
    end
  end
end
