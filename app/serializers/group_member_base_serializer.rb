class GroupMemberBaseSerializer < ActiveModel::Serializer
  attributes :id, :researcher, :role_id, :role_name,
             :gm_state_id, :gm_state_name, :gm_periods,
             :parent_id, :role_type_id

  def gm_periods
    self.object.gm_periods.map do |gm_period|
      {
          id: gm_period.id,
          initial_date: gm_period.initial_date,
          final_date: gm_period.final_date,
          role_id: gm_period.role_id,
          roleName: gm_period.role.name
      }
    end
  end

  def gm_state_id
    gm_state = self.object.gm_state
    if gm_state
      gm_state.id
    end
  end

  def gm_state_name
    gm_state = self.object.gm_state
    if gm_state
      gm_state.name
    end
  end

  def parent_id
    role = self.object.role
    if role
      role.parent_id
    end
  end

  def role_id
    role = self.object.role
    if role
      role.id
    end
  end

  def role_name
    role = self.object.role
    if role
      role.name
    end
  end

  def role_type_id
    role = self.object.role
    if role
      role.role_type_id
    end
  end

  def oas_researcher_id
    researcher = self.object.researcher
    if researcher
      researcher.oas_researcher_id
    end
  end
end
