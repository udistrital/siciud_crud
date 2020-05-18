class SeedbedMemberSerializer < ActiveModel::Serializer
  attributes :id, :researcher, :role, :state_researcher, :sm_periods

  def researcher
    self.object.researcher
  end

  def role
    {
      id: self.object.role.id,
      name: self.object.role.name,

    }
  end

  def sm_periods
    self.object.sm_periods.map do |sm_period|
      {
        id: sm_period.id,
        initialDate: sm_period.initialDate,
        finalDate: sm_period.finalDate,
        role_id: sm_period.role_id,
        roleName: sm_period.role.name,

      }
    end
    #    res
  end
end
