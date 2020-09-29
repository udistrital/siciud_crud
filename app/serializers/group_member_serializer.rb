class GroupMemberSerializer < ActiveModel::Serializer
  attributes :id, :researcher, :role, :gm_state, :gm_periods

  def researcher
    self.object.researcher
  end

  def role
      self.object.role.name
  end

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
end
