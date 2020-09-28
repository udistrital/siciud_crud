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
        @research_groups = ResearchGroup.all.order(:created_at)
        #Director .members.where("role_id='1'")
        #if params[:search].present? && !params[:search].nil?
        #Se envia al servicio de busqueda para flitrar los grupos segun los parametros

        @research_groups = ResearchGroupsSearchService.search(@research_groups,
                                                              params[:name],
                                                              params[:director],
                                                              params[:facultyid],
                                                              params[:category])
        #end
        #Se envian los grupos en formato JSON paginados de a 10 elementos por pagina
        paginate json: @research_groups.includes(:faculty_ids_research_groups,
                                                 :research_focuses, :state_group, :snies,
                                                 :cidcActDocument_attachment, :facultyActDocument_attachment),
                 each_serializer: ResearchGroupSimpleSerializer
      end

      #Se muestra en detalle un grupo de investigacion segun un ID que se envia en el get

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
        params.permit(:facultyActDocument, :cidcActDocument)
        if (params[:facultyActDocument])
          if (params[:facultyActDocument].content_type == "application/pdf")
            @research_group.facultyActDocument.attach(params[:facultyActDocument])
          else
            return render json: {"error": "El acta de facultad debe ser de formato pdf"}, status: :unprocessable_entity
          end
        end
        if (params[:cidcActDocument])
          if (params[:cidcActDocument].content_type == "application/pdf")
            @research_group.cidcActDocument.attach(params[:cidcActDocument])
          else
            return render json: {"error": "El acta del cidc debe ser de formato pdf"}, status: :unprocessable_entity
          end
        end
        render json: @research_group
      end

      private

      def save_data_by_key(research_gr)
        if params[:research_group].has_key?(:facultyIds)
          setFaculties((params[:research_group][:facultyIds]).uniq)
        end
        if params[:research_group].has_key?(:curricular_projectIds)
          setCurricularPrj((params[:research_group][:curricular_projectIds]).uniq)
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
          new_faculty = @research_group.faculty_ids_research_groups.new(facultyId: faculty)
          if new_faculty.valid?
            new_faculty.save
          end
        end
      end

      def setCurricularPrj(curricularprjs)
        @research_group.curricular_prj_ids_research_groups.destroy_all
        curricularprjs.map do |curr|
          new_curr = @research_group.curricular_prj_ids_research_groups.new(curricular_projectId: curr)
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
        params.require(:research_group).permit(:name, :acronym, :description, :cidcRegistrationDate,
                                               :cidcActNumber, :facultyActNumber,
                                               :director_name_tmp,
                                               :facultyRegistrationDate, :state_group_id,
                                               :group_type_id, :snies_id,
                                               :email, :colcienciasCode, :gruplac, :webpage,
                                               :mission, :vision, :facultyActDocument,
                                               :cidcActDocument, research_focus_ids: [],
                                               oecd_discipline_ids: [])
      end
    end
  end
end
