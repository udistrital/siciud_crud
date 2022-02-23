class ExternalMembersProposalSerializer < AbstractMemberSerializer
  attributes :id, :proposal_id,
             :role_id, :role_name, :contact,
             :active, :created_by, :updated_by,
             :created_at, :updated_at

  def contact
    cont = self.object.contact
    if cont
      {
        "name": cont.name,
        "email": cont.email,
        "phone": cont.phone,
        "identification_number": cont.identification_number,
        "identification_type_id": cont.identification_type_id,
        "mobile": cont.mobile,
        "address": cont.address
      }
    end
  end
end
