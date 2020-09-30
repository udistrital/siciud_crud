module Api
  module V1
    class ResearchGroupController < ApplicationController
      before_action :set_research_group, only: [:show, :update, :attach]

      # Handling of database exceptions
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: {error: e.message}, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: {error: e.message}, status: :unprocessable_entity
      end

      def index
        if (gt_id = params[:group_type_id])
          @research_groups = ResearchGroupsSearchService.filter_by_type(gt_id)
        else
          @research_groups = ResearchGroup.all.order(:created_at)
          @research_groups = ResearchGroupsSearchService.search(@research_groups,
                                                                params[:name],
                                                                params[:director],
                                                                params[:faculty_id],
                                                                params[:category])
        end
        paginate json: @research_groups,
                 each_serializer: ResearchGroupSimpleSerializer
      end

      def show
        render json: @research_group
      end

      def create
        #Crear el grupo de investigacion con los parametros que se envian
        @research_group = ResearchGroup.new(research_group_params)
        save_data_by_key(@research_group)
        if @research_group.save
          render json: @research_group, status: :created
        else
          render json: @research_group.errors, status: :unprocessable_entity
        end
      end

      #Se intenta actualizar el semillero con la informacion enviada en los parametros

      def update
        if @research_group.update(research_group_params)
          save_data_by_key(@research_group)

          if @research_group.save
            render json: @research_group
          else
            render json: @research_group.errors, status: :unprocessable_entity
          end
        else
          render json: @research_group.errors, status: :unprocessable_entity
        end
      end

      #Añadir los documentos de Facultad y de CIDC
      def attach
        params.permit(:faculty_act_document, :cidc_act_document, :document_of_establishment)
        msg = "debe ser formato pdf"
        if (file = params[:faculty_act_document])
          if (file.content_type == "application/pdf")
            @research_group.faculty_act_document.attach(file)
          else
            return render json: {"error": "El acta de facultad #{msq}"},
                          status: :unprocessable_entity
          end
        end
        if (file = params[:cidc_act_document])
          if (file.content_type == "application/pdf")
            @research_group.cidc_act_document.attach(file)
          else
            return render json: {"error": "El acta del cidc #{msq}"},
                          status: :unprocessable_entity
          end
        end
        if (file = params[:document_of_establishment])
          if (file.content_type == "application/pdf")
            @research_group.document_of_establishment.attach(file)
          else
            return render json: {"error": "El documento de constitución #{msq}"},
                          status: :unprocessable_entity
          end
        end
        render json: @research_group
      end

      private

      def save_data_by_key(research_gr)
        if params[:research_group].has_key?(:faculty_ids)
          setFaculties((params[:research_group][:faculty_ids]).uniq)
        end
        if params[:research_group].has_key?(:curricular_project_ids)
          setCurricularPrj((params[:research_group][:curricular_project_ids]).uniq)
        end
        if params[:research_group].has_key?(:oecd_discipline_ids)
          research_gr.oecd_discipline_ids = (params[:research_group][:oecd_discipline_ids]).map(&:to_i).uniq
        end
        if params[:research_group].has_key?(:cine_detailed_area_ids)
          research_gr.cine_detailed_area_ids = (params[:research_group][:cine_detailed_area_ids]).map(&:to_i).uniq
        end
      end

      def setFaculties(faculties)
        @research_group.faculty_ids_research_groups.destroy_all
        faculties.map do |faculty|
          new_faculty = @research_group.faculty_ids_research_groups.new(faculty_id: faculty)
          if new_faculty.valid?
            new_faculty.save
          end
        end
      end

      def setCurricularPrj(curricularprjs)
        @research_group.curricular_prj_ids_research_groups.destroy_all
        curricularprjs.map do |curr|
          new_curr = @research_group.curricular_prj_ids_research_groups.new(curricular_project_id: curr)
          if new_curr.valid?
            new_curr.save
          end
        end
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
                                               :mission, :vision,
                                               :colciencias_code,
                                               :group_type_id, :snies_id,
                                               research_focus_ids: [],
                                               oecd_discipline_ids: [])
      end
    end
  end
end
