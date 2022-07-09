class InternalMembersProposalSerializer < AbstractMemberSerializer
  attributes :id, :proposal_id,
             :role_id, :role_name, :researcher,
             :active, :created_by, :updated_by,
             :created_at, :updated_at

  def researcher
    res = self.object.researcher
    if res
      {
        "id": res.id,
        "orcid_id": res.orcid_id,
        "oas_researcher_id": res.oas_researcher_id,
        "phone_number_one": res.phone_number_one,
        "phone_number_two": res.phone_number_two,
        "identification_number": res.identification_number,
        "mobile_number_one": res.mobile_number_one,
        "mobile_number_two": res.mobile_number_two,
        "address": res.address
      }
    end
  end
end
