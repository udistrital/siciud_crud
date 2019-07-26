module Api
  module V1
    class ResearchGroupController < ApplicationController
      before_action :set_research_group, only: [:show, :update, :attach]

      #Manejo de excepciones de la database
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: { error: e.message }, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: { error: e.message }, status: :unprocessable_entity
      end
      #Listar todos los grupos

      def index
        @research_groups = ResearchGroup.all
        #Director .members.where("role_id='1'")
        #if params[:search].present? && !params[:search].nil?
        #Se envia al servicio de busqueda para flitrar los grupos segun los parametros
        @research_groups = ResearchGroupsSearchService.search(@research_groups, params[:name], params[:director], params[:facultyid], params[:category])
        #end
        #Se envian los grupos en formato JSON paginados de a 10 elementos por pagina
        paginate json: @research_groups.includes(:faculties, :curricular_projects, :research_focuses,
                                                 :state_group, :snies, :cidcActDocument_attachment, :facultyActDocument_attachment)
      end

      #Se muestra en detalle un grupo de investigacion segun un ID que se envia en el get

      def show
        render json: @research_group
      end

      #Crear un grupo
      def create
        #Crear el grupo de investigacion con los parametros que se envian
        @research_group = ResearchGroup.new(research_group_params)
        #Revisar si se enviaron facultades,lineas de investigacion e proyectos curriculares
        #y añadirselas al grupo (relacion muchos a muchos)
        # if (faculties = research_group_params[:faculty_ids])
        #   faculties = faculties.split(',')
        #   @research_group.faculty_ids = faculties
        # end
        #if (research_focus_ids = research_group_params[:research_focus_ids])
        #research_focus_ids = research_focus_ids.split(",")
        #@research_group.research_focus_ids = research_focus_ids
        #end
        #if (curricular_project_ids = research_group_params[:curricular_project_ids])
        #curricular_project_ids = curricular_project_ids.split(",")
        #@research_group.curricular_project_ids = curricular_project_ids
        setFaculties
        #end
        if @research_group.save
          render json: @research_group, status: :created
        else
          render json: @research_group.errors, status: :unprocessable_entity
        end
      end

      #Se intenta actualizar el semillero con la informacion enviada en los parametros

      def update
        if @research_group.update(research_group_params)
          # if(faculties = research_group_params[:faculty_ids])
          # faculties = faculties.split(',')
          # @research_group.faculty_ids = faculties
          # end
          #if (research_focus_ids = research_group_params[:research_focus_ids])
          #research_focus_ids = research_focus_ids.split(",")
          #@research_group.research_focus_ids = research_focus_ids
          #end
          #if (curricular_project_ids = research_group_params[:curricular_project_ids])
          # curricular_project_ids = curricular_project_ids.split(",")
          #@research_group.curricular_project_ids = curricular_project_ids
          #setFaculties
          #end
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
          @research_group.facultyActDocument.attach(params[:facultyActDocument])
        end
        if (params[:cidcActDocument])
          @research_group.cidcActDocument.attach(params[:cidcActDocument])
        end
      end

      private

      def setFaculties
        @research_group.faculties.clear
        faculties = []
        @research_group.curricular_projects.each do |curricular_project|
          if !@research_group.faculties.exists?(id: curricular_project.faculty.id)
            #@research_group.faculties << curricular_project_id.faculty
            faculties.push(curricular_project.faculty.id)
          end
        end
        @research_group.faculty_ids = faculties.uniq
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_research_group
        @research_group = ResearchGroup.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def research_group_params
        params.require(:research_group).permit(:name, :acronym, :description, :cidcRegistrationDate,
                                               :cidcActNumber, :facultyActNumber, :facultyRegistrationDate, :state_group_id,
                                               :snies_id, :email, :colcienciasCode, :gruplac, :webpage, :mission, :vision, :facultyActDocument, :cidcActDocument,
                                               research_focus_ids: [], curricular_project_ids: [])
      end
    end
  end
end
