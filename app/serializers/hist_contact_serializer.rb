class HistContactSerializer < ActiveModel::Serializer
  attributes :id, :is_current, :contact_id, :contact_name,
             contact_email, contact_phone, :dependency,
             :active, :created_by, :updated_by,
             :created_at, :updated_at

  def contact_name
    contact = self.object.contact
    if contact
      contact.name
    end
  end

  def contact_email
    contact = self.object.contact
    if contact
      contact.email
    end
  end

  def contact_phone
    contact = self.object.contact
    if contact
      contact.phone
    end
  end
end
