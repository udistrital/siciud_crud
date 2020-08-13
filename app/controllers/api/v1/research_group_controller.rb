module Api
  module V1
    class ResearchGroupController < ApplicationController
      before_action :set_research_group, only: [:show, :update, :attach]

      # Handling of database exceptions
      rescue_from ActiveRecord::RecordNotFound do |e|
        render json: { error: e.message }, status: :not_found
      end
      rescue_from ActiveRecord::RecordInvalid do |e|
        render json: { error: e.message }, status: :unprocessable_entity
      end

      def index
        @research_groups = ResearchGroup.all.order(:created_at)
        #Director .members.where("role_id='1'")
        #if params[:search].present? && !params[:search].nil?
        #Se envia al servicio de busqueda para flitrar los grupos segun los parametros
        @research_groups = ResearchGroupsSearchService.search(@research_groups, params[:name], params[:director], params[:facultyid], params[:category])
        #end
        #Se envian los grupos en formato JSON paginados de a 10 elementos por pagina
        paginate json: @research_groups.includes(:faculties, :curricular_projects, :research_focuses,
                                                 :state_group, :snies, :cidcActDocument_attachment, :facultyActDocument_attachment),
                 each_serializer: ResearchGroupSimpleSerializer
      end

      #Se muestra en detalle un grupo de investigacion segun un ID que se envia en el get

      def show
        render json: @research_group
      end

      def create
        #Crear el grupo de investigacion con los parametros que se envian
        @research_group = ResearchGroup.new(research_group_params)
        if params[:research_group].has_key?(:curricular_project_ids)
          @research_group.curricular_project_ids = (params[:research_group][:curricular_project_ids]).uniq
        end
        if params[:research_group].has_key?(:oecd_discipline_ids)
          @research_group.oecd_discipline_ids = (params[:research_group][:oecd_discipline_ids]).map(&:to_i).uniq
        end

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
          if params[:research_group].has_key?(:curricular_project_ids)
            @research_group.curricular_project_ids = (params[:research_group][:curricular_project_ids]).uniq
          end
          if params[:research_group].has_key?(:oecd_discipline_ids)
            @research_group.oecd_discipline_ids = (params[:research_group][:oecd_discipline_ids]).map(&:to_i).uniq
          end
          setFaculties
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
            return render json: { "error": "El acta de facultad debe ser de formato pdf" }, status: :unprocessable_entity
          end
        end
        if (params[:cidcActDocument])
          if (params[:cidcActDocument].content_type == "application/pdf")
            @research_group.cidcActDocument.attach(params[:cidcActDocument])
          else
            return render json: { "error": "El acta del cidc debe ser de formato pdf" }, status: :unprocessable_entity
          end
        end
        render json: @research_group
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
                                               :cidcActNumber, :facultyActNumber,
                                               :facultyRegistrationDate, :state_group_id, :snies_id,
                                               :email, :colcienciasCode, :gruplac, :webpage,
                                               :mission, :vision, :facultyActDocument,
                                               :cidcActDocument, research_focus_ids: [],
                                               curricular_project_ids: [],
                                               historical_colciencias_ranks: [],
                                               oecd_discipline_ids: [])
      end
    end
  end
end
