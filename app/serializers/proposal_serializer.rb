class ProposalSerializer < ActiveModel::Serializer
  attributes :id, :title, :call_id, :call_code, :call_name,
             :description, :duration, :entities, :proposal_status_id,
             :proposal_status_name, :project_type_id, :project_type_name,
             :active, :created_by, :updated_by, :created_at, :updated_at

  def call_name
    call = self.object.call
    if call
      call.call_name
    end
  end

  def call_code
    call = self.object.call
    if call
      call.call_code
    end
  end

  def entities
    # TODO validar que sean unicos los ids
    complete_entities = []
    entity_list = self.object.entities
    dependency_list = self.object.dependencies
    if dependency_list
      complete_dependencies = []
      dependency_list.each do |dep|

      end
    end
    complete_entities = [{ "entity_id": 1,
                           "entity_name": "Motorola",
                           "dependencies": [
                             { "dependency_id": 1,
                               "dependency_name": "Dirección de desarrollo e innovación Telnet"
                             },
                             { "dependency_id": 5,
                               "dependency_name": "Gestión del talento"
                             }
                           ]
                         }]
    complete_entities
  end

  def research_groups
    complete_rgs = []
    research_groups_list = self.object.research_groups
    research_groups_list.each do |rg|
      data = {
        "research_group_id": rg.id,
        "research_group_name": rg.name
      }
      complete_rgs.append(data)
    end
    complete_rgs
  end

  def proposal_status_name
    proposal_status = self.object.proposal_status
    if proposal_status
      proposal_status.st_name
    end
  end

  def project_type_name
    project_type = self.object.project_type
    if project_type
      project_type.st_name
    end
  end
end
