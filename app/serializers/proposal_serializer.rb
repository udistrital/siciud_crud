class ProposalSerializer < ActiveModel::Serializer
  attributes :id, :title, :call_id, :call_code, :call_name,
             :description, :duration, :geo_country_ids, :geo_country_id,
             :geo_state_ids, :geo_city_ids, :evaluator_ids, :keywords,
             :proposal_status_id, :proposal_status_name, :project_type_id,
             :project_type_name, :research_focuses, :total_amount_in_kind,
             :total_amount_request_cidc, :total_counterparty,
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

  # def entities
  #   complete_entities = []
  #   entity_dependencies = {}
  #   entity_list = self.object.entities
  #   dependency_list = self.object.dependencies
  #   if dependency_list
  #     dependency_list.each do |dep|
  #       entity_id = dep.entity_id
  #       if entity_dependencies.has_key? entity_id
  #         entity_dependencies[entity_id][:dependencies].append(
  #           {
  #             "dependency_id": dep.id,
  #             "dependency_name": dep.name
  #           }
  #         )
  #       else
  #         entity_dependencies[entity_id] = {
  #           "entity_id": entity_id,
  #           "entity_name": dep.entity.name,
  #           "dependencies": [
  #             {
  #               "dependency_id": dep.id,
  #               "dependency_name": dep.name
  #             }
  #           ]
  #         }
  #       end
  #     end
  #
  #     entity_list.each do |entity|
  #       entity_id = entity.id
  #       if entity_dependencies.has_key? entity_id
  #         data = entity_dependencies[entity_id]
  #       else
  #         data = {
  #           "entity_id": entity_id,
  #           "entity_name": entity.name,
  #           "dependencies": []
  #         }
  #       end
  #       complete_entities.append(data)
  #     end
  #   else
  #     entity_list.each do |entity|
  #       data = {
  #         "entity_id": entity.id,
  #         "entity_name": entity.name,
  #         "dependencies": []
  #       }
  #       complete_entities.append(data)
  #     end
  #   end
  #   complete_entities
  # end
  #
  # def geo_cities
  #   complete_geo_cities = []
  #   geo_list = self.object.geo_cities
  #   if geo_list
  #     geo_list.each do |geo|
  #       data = {
  #         "geo_city_id": geo.id,
  #         "geo_city_name": geo.name
  #       }
  #       complete_geo_cities.append(data)
  #     end
  #   end
  #   complete_geo_cities
  # end

  def geo_state_ids
    complete_geo_states = []
    geo_city_list = self.object.geo_cities
    if geo_city_list
      geo_city_list.each do |city|
        complete_geo_states.append(city.geo_state_id)
      end
    end
    complete_geo_states.uniq
  end

  def geo_country_ids
    complete_geo_country = []
    geo_city_list = self.object.geo_cities
    if geo_city_list
      geo_city_list.each do |city|
        state = city.geo_state
        complete_geo_country.append(state.geo_country_id)
      end
    end
    complete_geo_country.uniq
  end

  def geo_country_id
    geo_city_list = self.object.geo_cities
    if geo_city_list
      state = geo_city_list[0].geo_state
      state.geo_country_id
    end
  end

  def keywords
    complete_keywords = []
    keyword_list = self.object.keywords
    if keyword_list
      keyword_list.each do |keyword|
        complete_keywords.append(keyword.name)
      end
    end
    complete_keywords
  end

  def research_focuses
    complete_research_focuses = []
    research_focus_list = self.object.research_focuses
    if research_focus_list
      research_focus_list.each do |rf|
        data = {
          "research_focus_id": rf.id,
          "research_focus_name": rf.st_name
        }
        complete_research_focuses.append(data)
      end
    end
    complete_research_focuses
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
